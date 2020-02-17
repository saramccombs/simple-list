class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :account_from_current_user, :family_parents_from_current_user, :family_children_from_current_user

  def hello
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, parent_attributes: [:name, :team_name]])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end

  # TODO Review with Jake where helper methods are best implemented

  def account_from_current_user
    if current_user.account_type == "Parent"
      Parent.find_by(id: current_user.account_id)
    elsif current_user.account_type == "Child"
      Child.find_by(id: current_user.account_id)
    else
      nil
    end
  end

  def family_parents_from_current_user
    Parent.where(team_name: account_from_current_user.team_name)
  end

  def family_children_from_current_user
    Child.where(team_name: account_from_current_user.team_name)
  end
end
