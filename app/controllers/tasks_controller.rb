class TasksController < ApplicationController
  def new
    @ideaboard = find_ideaboard(params[:ideaboard_id])
    @task = Task.find_by(id: params[:id])
    @list = find_list(params[:list_id])
    @task = Task.new
  end

  def create
    @list = find_list(params[:list_id])
    @ideaboard = find_ideaboard(params[:ideaboard_id])
    #TODO TASK: Why does .build not work here? Refactor this.
    @task = Task.new
    @task.task_desc = params[:task][:task_desc]
    @task.task_priority = params[:task][:task_priority]
    @task.list_id = params[:list_id]
    @task.user_id = params[:user_id]
    @task.tag_id = params[:tag_id]
    @task.save
    if @task.save
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      flash[:errors] = @task.errors.full_messages
      render :new
    end
  end

  def edit
    @ideaboard = find_ideaboard(params[:ideaboard_id])
    @list = find_list(params[:list_id])
    @task = Task.find_by(id: params[:id])
  end

  def update
    @ideaboard = find_ideaboard(params[:ideaboard_id])
    @list = find_list(params[:list_id])
    @task = Task.find_by(id: params[:id])
    @task.list_id = params[:new_list_id]
    @task.tag_id = params[:new_tag_id]
    if @task.update(task_params)
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], params[:list_id])
    else
      flash[:errors] = @task.errors.full_messages
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
