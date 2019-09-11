class Tasks::TaskUpdater

  def initialize(task, params)
    @task = task
    @params = params
  end

  def call
    OpenStruct.new(success?: @task.update(@params), task: @task, errors: nil)
  end
end