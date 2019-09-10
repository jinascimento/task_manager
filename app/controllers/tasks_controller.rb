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
    respond_to do |format|
      if @task.save
        format.js { render 'tasks/create', status: :created, location: @task }
      else
        format.js { render 'tasks/new', status: :unprocessable_entity, location: @task }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js { render 'tasks/update', status: :ok, location: @task }
      else
        format.js { render 'tasks/edit', status: :unprocessable_entity, location: @task }
      end
    end
  end

  def destroy
    @task.destroy
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
