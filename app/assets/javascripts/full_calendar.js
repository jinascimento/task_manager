var initialize_calendar;
initialize_calendar = function() {
    $('.calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            lang: 'pt-br',
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            events: '/tasks.json',

            select: function(start, end) {
                $.getScript('/tasks/new', function() {
                    $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
                });

                calendar.fullCalendar('unselect');
            },

            eventDrop: function(task, delta, revertFunc) {
                task_data = {
                    task: {
                        id: task.id,
                        start: task.start.format(),
                        end: task.end.format()
                    }
                };
                $.ajax({
                    url: task.update_url,
                    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                    data: task_data,
                    type: 'PATCH'
                });
            },

            eventClick: function(task, jsEvent, view) {
                $.getScript(task.edit_url, function() {
                    $('#event_date_range').val(moment(task.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(task.end).format("MM/DD/YYYY HH:mm"))
                    date_range_picker();
                    $('.start_hidden').val(moment(task.start).format('YYYY-MM-DD HH:mm'));
                    $('.end_hidden').val(moment(task.end).format('YYYY-MM-DD HH:mm'));
                });
            }
        });
    })
};
$(document).on('turbolinks:load', initialize_calendar);