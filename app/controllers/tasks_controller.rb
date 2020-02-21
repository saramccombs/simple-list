class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @list = List.find_by(id: params[:list_id])
    #TODO Why does .build not work here?
    #TODO Refactor this.
    @task = Task.new
    @task.task_desc = params[:task][:task_desc]
    @task.task_priority = params[:task][:task_priority]
    @task.list_id = params[:list_id]
    @task.user_id = params[:user_id]
    @task.save
    if @task.save
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], @list)
    else
      render new_user_ideaboard_list_task
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], params[:list_id])
    else
      #TODO: Add error message 'update failed'
      render edit_user_ideaboard_list_task
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
