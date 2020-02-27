class ListsController < ApplicationController
  before_action :set_ideaboard
  before_action :find_list, only: [:edit, :update, :destroy, :show]

  def new
    @list = List.new
  end

  def create
    @list = @ideaboard.lists.build(list_params)
    if @list.save
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to user_ideaboard_path(current_user, @ideaboard)
  end

  def show
    if params[:task_priority_sort] == "All"
      @tasks = @list.tasks
    elsif params[:task_priority_sort] == "High"
      @tasks = Task.find_list(params[:id]).high_priority
    elsif params[:task_priority_sort] == "Medium"
      @tasks = Task.find_list(params[:id]).medium_priority
    elsif params[:task_priority_sort] == "Low"
      @tasks = Task.find_list(params[:id]).low_priority
    elsif params[:task_priority_sort] == "n/a"
      @tasks = Task.find_list(params[:id]).no_priority
    else
      @tasks = @list.tasks
    end
  end

  private

  def find_list
    @list = List.find_by(id: params[:id])
  end

  def list_params
    params.require(:list).permit(:user_id, :list_name, :list_desc, :ideaboard_id)
  end
end
