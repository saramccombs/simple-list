class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new
    @list.list_name = params[:list][:list_name]
    @list.list_desc = params[:list][:list_desc]
    @list.ideaboard_id = params[:ideaboard_id]
    @list.user_id = params[:user_id]
    
    #TODO LIST: Why does .build not work here? Refactor this.
    # @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], @list)
    else
      render new_user_ideaboard_list(current_user, params[:ideaboard_id])
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update(list_params)
      redirect_to user_ideaboard_list_path(current_user, params[:ideaboard_id], @list)
    else
      #TODO: Add error message 'update failed'
      render edit_user_ideaboard_list
    end
  end

  def destroy
    #TODO Add error message asking for confirming deletion of list if full of tasks.
    @list = List.find_by(id: params[:id])
    @list.destroy
    redirect_to user_ideaboard_path(current_user, params[:ideaboard_id])
  end

  def show
    @ideaboard = Ideaboard.find_by(id: params[:ideaboard_id])
    @list = List.find_by(id: params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :list_name, :list_desc, :ideaboard_id)
  end
end
