class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "You have created your user account!"
      redirect_to users_path
    else
      render :new
      flash[:alert] = "You made a mistake and your user account was not created."
    end

  end
end
