class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def hello
  end

  def show
  end

  # Helper method exposed to the whole app
  # Cannot be used within the Ideaboard controller, use find_ideaboard
  def set_ideaboard
    @ideaboard = Ideaboard.find_by(id: params[:ideaboard_id])
  end

  # Helper method exposed to the whole app
  # Cannot be used within the List controller, use find_list
  def set_list
    @list = List.find_by(id: params[:list_id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end
end
