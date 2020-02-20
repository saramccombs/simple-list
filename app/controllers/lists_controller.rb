class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @ideaboard = Ideaboard.find_by(id: params[:ideaboard_id])
    @list = @ideaboard.lists.build(list_params)
    if @list.save
      redirect_to user_ideaboard_list_path(current_user, @ideaboard, @list)
    else
      render new_user_ideaboard_list
    end
  end

  def edit
    @list = List.find_by(id: params[:id])
  end

  def update
    @list = List.find_by(id: params[:id])
    if @list.update(list_params)
      redirect_to [current_user, @list]
    else
      #TODO: Add error message 'update failed'
      render edit_user_ideaboard_list
    end
  end

  def destroy
    @list = List.find_by(id: params[:id])
    @list.destroy
    redirect_to root_url
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
