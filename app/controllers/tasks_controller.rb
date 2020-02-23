class TasksController < ApplicationController
  def new
    @ideaboard = find_ideaboard(params[:ideaboard_id])
    @task = Task.find_by(id: params[:id])
    @list = find_list(params[:list_id])
    @task = Task.new
  end

  def create
    byebug
    @list = find_list(params[:list_id])
    #TODO TASK: Why does .build not work here? Refactor this.
    @task = Task.new
    @task.task_desc = params[:task][:task_desc]
    @task.task_priority = params[:task][:task_priority]
    @task.list_id = params[:list_id]
    @task.user_id = params[:user_id]
    @task.save
    if @task.save
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], @list)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @ideaboard = find_ideaboard(params[:ideaboard_id])
    @list = find_list(params[:list_id])
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], params[:list_id])
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], params[:list_id])
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :task_desc, :list_id, :task_priority, :ideaboard_id)
  end
end
