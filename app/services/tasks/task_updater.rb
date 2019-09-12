class Tasks::TaskUpdater
  COLOR_BY_PRIORITY = { low: '#6fd86f', medium: '#7471F9', high: '#FF2A2B' }.freeze
  def initialize(task, params)
    @task = task
    @params = params
  end

  def call
    change_color_by_priority
    OpenStruct.new(success?: @task.update(@params), task: @task, errors: nil)
  end

  def change_color_by_priority
    if @params[:priority]
      @task.color = COLOR_BY_PRIORITY[@params[:priority].to_sym]
    end
  end
end