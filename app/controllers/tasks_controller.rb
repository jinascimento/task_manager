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
    task_creator = Tasks::TaskCreator.new(task_params).call
    @task = task_creator.task
    if task_creator.success?
      render 'tasks/create', status: :created
    else
      render 'tasks/new', status: :unprocessable_entity
    end
  end

  def update
    task_updater = Tasks::TaskUpdater.new(@task, task_params).call
    @task = task_updater.task
    if task_updater.success?
      render 'tasks/update', status: :ok
    else
      render 'tasks/edit', status: :unprocessable_entity
    end
  end

  def destroy
    task_destroyer = Tasks::TaskDestroyer.new(@task).call
    @task = task_destroyer.task
    respond_to do |format|
      format.js { render 'tasks/destroy', head: :no_content }
    end
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
