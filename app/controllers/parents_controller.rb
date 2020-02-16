class ParentsController < ApplicationController
  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.user_id = current_user.id 
    @parent.save

    current_user.account_id = @parent.id
    current_user.account_type = @parent.class
    current_user.save

    redirect_to root_url
  end

  private

  def parent_params
    params.require(:parent).permit(:name, :team_name)
  end
end
