class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
    @tweets = Tweet.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user])
      flash[:notice] = "Updated user information!"
      redirect_to users_path
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
