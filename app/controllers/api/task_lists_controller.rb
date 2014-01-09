class Api::TaskListsController < ApplicationController
  respond_to :json
  before_action :check_owner, only: [:show, :update, :destroy]

  def index
    respond_with(current_user.task_lists, include: :tasks)
  end

  def create
  end

  private
  def check_owner
    permission_denied if current_user != task_list.owner
  end

  def task_list
    @task_list ||= TaskList.find(params[:id])
  end

  def safe_params
    params.require(:list).permit(:name)
  end
end
