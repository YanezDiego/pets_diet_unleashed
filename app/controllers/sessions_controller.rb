class SessionsController < ApplicationController

  skip_before_action :require_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if params[:user] #local authenticate
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to pets_path
      else
        redirect_to login_path
      end #local authenticate end
      
    elsif params[:code] #github path authenticate
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['nickname']
        u.email = auth['info']['email']
        u.name = auth['info']['name']
        u.password = auth['uid']
      end # loop end
      session[:user_id] = @user.id
      redirect_to pets_path
    end #if statement end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


  private

  def auth
   request.env['omniauth.auth']
  end

end
