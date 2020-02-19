class IdeaboardsController < ApplicationController

  def new
    @ideaboard = Ideaboard.new
  end

  def create
    @ideaboard = current_user.ideaboards.build(ideaboard_params)
    if @ideaboard.save
      redirect_to [current_user, @ideaboard]
    else
      render new_user_ideaboard
    end
  end

  def edit
    @ideaboard = Ideaboard.find_by(id: params[:id])
  end

  def update
    @ideaboard = Ideaboard.find_by(id: params[:id])
    if @ideaboard.update(ideaboard_params)
      redirect_to [current_user, @ideaboard]
    else
      #TODO: Add error message 'update failed'
      render edit_user_ideaboard
    end
  end

  def destroy
    @ideaboard = Ideaboard.find_by(id: params[:id])
    @ideaboard.destroy
    redirect_to root_url
  end

  def show
    byebug
    @ideaboard = Ideaboard.find_by(id: params[:id])
    byebug
  end

  private

  def ideaboard_params
    params.require(:ideaboard).permit(:user_id, :ideaboard_name, :ideaboard_desc)
  end
end
