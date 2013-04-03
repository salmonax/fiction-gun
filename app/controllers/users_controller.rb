class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path, notice: "You have created your user account!"
    else
      flash.now[:alert] = "There were errors"
      render :new
    end

  end

  def index
    @users = User.all
  end

end
