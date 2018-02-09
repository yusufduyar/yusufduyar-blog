class ApplicationController < ActionController::Base
  before_action :authorize_user
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private
  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authorize_user
    puts ">>>> authorizing user"
    if !logged_in?
      flash[:danger] = 'You are not allowed to do that unless you are logged in'
      redirect_to login_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end
end