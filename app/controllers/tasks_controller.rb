class TasksController < ApplicationController
  rescue_from Exception do |err|
    render json: {error: err.message}, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |err|
    render json: {error: err.message}, status: :unprocessable_entity
  end

  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end

  def show
    @task = Task.find(params[:id])
    render json: @task, status: :ok
  end

  def create
    @task = Task.create!(task_params)
    render json: @task, status: :ok
  end

  def update
    @task = Task.find(params[:id])
    @task.update!(task_params)
    render json: @task, status: :ok
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(
      :name, 
      :description,
      :due_date,
      :category_id,
      :user_id,
      :finished,
      participating_users_attributes: [:task_id, :role_id, :user_id, :_destroy])
  end
end