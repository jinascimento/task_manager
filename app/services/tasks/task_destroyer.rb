class Tasks::TaskDestroyer

  def initialize(task)
    @task = task
  end

  def call
    OpenStruct.new(success?: @task.destroy, task: @task)
  end
end