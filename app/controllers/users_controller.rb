class UsersController < ApplicationController

skip_before_action :require_logged_in, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path #Need to add flash msg for errors
      end
  end

  def show
    if logged_in?
      find_user
    else
      redirect_to login_path #Need to add flash msg for errors
    end
  end



  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password)
  end


end
