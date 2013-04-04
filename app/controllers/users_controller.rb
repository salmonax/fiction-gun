class UsersController < ApplicationController

  before_filter :authorize, only: [:index, :edit, :destroy, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: "You have created your user account!"
    else
      flash.now[:alert] = "There were errors"
      render :new
    end

  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Your profile has been obliterated!"
    redirect_to signup_url
  end

end
