class Api::TaskListsController < ApplicationController
  respond_to :json
  # before_filter :authenticate_user!, except: [:index,:create]

  before_action :check_owner, only: [:show, :update, :destroy]

  def index
    # current_or_guest_user
    respond_with(current_or_guest_user.task_lists, include: :tasks)
  end

  def show
    # binding.pry
    respond_with(task_list, include: :tasks)
  end

  def create
    list = current_or_guest_user.task_lists.create!(safe_params)
    respond_with(list)
  end

  def destroy
    task_list.destroy
    render nothing: true, status: 204
  end

  private
  def check_owner
    permission_denied if current_or_guest_user != task_list.owner
  end

  def task_list
    @task_list ||= TaskList.find(params[:id])
  end

  def safe_params
    params.require(:list).permit(:name)
  end
end
