class IdeaboardsController < ApplicationController
before_action :find_ideaboard, only: [:edit, :update, :destroy, :show]

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
  end

  def update
    if @ideaboard.update(ideaboard_params)
      redirect_to [current_user, @ideaboard]
    else
      flash[:errors] = @ideaboard.errors.full_messages
      render :edit
    end
  end

  def destroy
    @ideaboard.destroy
    redirect_to root_url
  end

  def show
    if params[:list_name]
      @lists = List.where('list_name LIKE ?', "%#{params[:list_name]}%")
      if !@lists.empty?
        @lists
      end
    else
      @lists = @ideaboard.lists
    end
  end

  private

  def find_ideaboard
    @ideaboard = Ideaboard.find_by(id: params[:id])
  end

  def ideaboard_params
    params.require(:ideaboard).permit(:user_id, :ideaboard_name, :ideaboard_desc, :list_name)
  end
end
