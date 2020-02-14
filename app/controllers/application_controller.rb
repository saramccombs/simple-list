class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def hello
  end
end
