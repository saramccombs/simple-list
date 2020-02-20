class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    byebug
    @list = List.find_by(id: params[:list_id])
    @task = current_user.lists.tasks.build(task_params)
    byebug
    if @task.save
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
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
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      #TODO: Add error message 'update failed'
      render edit_user_ideaboard_list_task
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :task_desc, :list_id, :task_priority, :ideaboard_id)
  end
end
