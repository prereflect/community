class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      signin_user!(user)
    else
      flash[:error] = 'Your username or password is incorrect'
      redirect_to signin_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have succesfully signed out'
    redirect_to root_url
  end

  private

  def signin_user!(user)
    session[:user_id] = user.id
    flash[:notice] = 'You have succesfully signed in'
    redirect_to root_url
  end
end
