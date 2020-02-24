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
    find_ideaboard
  end

  def update
    find_ideaboard
    if @ideaboard.update(ideaboard_params)
      redirect_to [current_user, @ideaboard]
    else
      flash[:errors] = @ideaboard.errors.full_messages
      render :edit
    end
  end

  def destroy
    find_ideaboard
    @ideaboard.destroy
    redirect_to root_url
  end

  def show
    find_ideaboard
  end

  private

  def find_ideaboard
    @ideaboard = Ideaboard.find_by(id: params[:id])
  end

  def ideaboard_params
    params.require(:ideaboard).permit(:user_id, :ideaboard_name, :ideaboard_desc)
  end
end
