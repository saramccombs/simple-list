class TasksController < ApplicationController
  before_action :set_ideaboard
  before_action :set_list

  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.build(task_params)

    # tag_id would not get assigned without this line
    @task.tag_id = params[:tag_id]
    if @task.save
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      flash[:errors] = @task.errors.full_messages
      render :new
    end
  end

  def edit
    find_task
  end

  def update
    find_task
    @task.list_id = params[:new_list_id]
    @task.tag_id = params[:new_tag_id]
    if @task.update(task_params)
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      flash[:errors] = @task.errors.full_messages
      render :edit
    end
  end

  def destroy
    find_task
    @task.destroy
    redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
  end

  private

  def find_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:user_id, :task_desc, :list_id, :task_priority, :ideaboard_id, :tag_id)
  end
end
