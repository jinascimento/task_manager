class Tasks::TaskCreator
  COLOR_BY_PRIORITY = { low: '#6fd86f', medium: '#7471F9', high: '#FF2A2B' }.freeze
  def initialize(params)
    @params = params
  end

  def call
    @task = Task.new(@params)
    @task.pending!
    set_color_by_priority
    OpenStruct.new(success?: @task.save, task: @task, errors: nil)
  end

  def set_color_by_priority
    @task.color = COLOR_BY_PRIORITY[@task.priority.to_sym]
  end
end