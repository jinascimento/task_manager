# frozen_string_literal: true

class TasksController < ApplicationController
  protect_from_forgery with: :exception
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.where(start: params[:start]..params[:end])
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    binding.pry
    @task.update(task_params)
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :date_range, :start, :end,
                                 :responsible_id, :priority, :description)
  end
end
