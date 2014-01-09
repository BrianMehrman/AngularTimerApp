class Api::TasksController < ApplicationController
  before_action :check_owner
  respond_to :json

  def index
    respond_with(task_list.tasks)
  end

  def create
    s_params = safe_params.merge({creator: task_list.owner})
    task = task_list.tasks.create!(s_params)
    respond_with(task)
  end

  def update
    task.update_attributes(safe_params)
    respond_with(task)
  end

  def destroy
    task.destroy
    render nothing: true, status: 204
  end

  private
  def task_list
    @task_list ||= TaskList.find(params[:task_list_id])
  end

  def task
    @task ||= task_list.tasks.find(params[:id])
  end

  def safe_params
    params.require(:task).permit(:name,:description, :complete, :due_date)
  end

  def check_owner
    permission_denied if current_user != task_list.owner
  end

end
