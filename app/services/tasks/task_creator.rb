class Tasks::TaskCreator

  def initialize(params)
    @params = params
  end

  def call
    @task = Task.new(@params)
    OpenStruct.new(success?: @task.save, task: @task, errors: nil)
  end
end