class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def hello
  end

  def show
  end

  # Helper method exposed to the whole app
  # Cannot be used within the Ideaboard controller as is
  def find_ideaboard(id)
    Ideaboard.find_by(id: id)
  end

  # Helper method exposed to the whole app
  # Cannot be used within the List controller as is
  def find_list(id)
    List.find_by(id: id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end
end
