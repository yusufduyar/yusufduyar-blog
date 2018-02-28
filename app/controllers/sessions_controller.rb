class SessionsController < ApplicationController
  skip_before_action :authorize_user, only: [:new, :create]

  def new
    render :layout => false
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    # byebug

    if !@user.nil? &&  @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "We could not find your user name or password. Please try again."

      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end