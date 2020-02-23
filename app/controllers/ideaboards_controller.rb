class IdeaboardsController < ApplicationController
  def new
    @ideaboard = Ideaboard.new
  end

  def create
    @ideaboard = current_user.ideaboards.build(ideaboard_params)
    if @ideaboard.save
      redirect_to [current_user, @ideaboard]
    else
      flash[:errors] = @ideaboard.errors.full_messages
      render :new
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
      flash[:errors] = @ideaboard.errors.full_messages
      render :edit
    end
  end

  def destroy
    @ideaboard = Ideaboard.find_by(id: params[:id])
    @ideaboard.destroy
    redirect_to root_url
  end

  def show
    @ideaboard = Ideaboard.find_by(id: params[:id])
  end

  private

  def ideaboard_params
    params.require(:ideaboard).permit(:user_id, :ideaboard_name, :ideaboard_desc)
  end
end
