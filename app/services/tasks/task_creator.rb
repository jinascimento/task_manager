class Tasks::TaskCreator
  COLOR_BY_PRIORITY = { 0 => '#6fd86f', 1 => '#7471F9', 2 => '#FF2A2B' }.freeze
  def initialize(params)
    @params = params
  end

  def call
    @task = Task.new(@params)
    @task.color = COLOR_BY_PRIORITY[@task.priority]
    @task.pending!
    OpenStruct.new(success?: @task.save, task: @task, errors: nil)
  end
end