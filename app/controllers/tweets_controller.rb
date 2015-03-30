class TweetsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def show
    @user = User.find(params[:user_id])
    @tweet = @user.tweets
  end

  def new
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.save
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end
    flash[:notice] = "Thanks for tweeting!"
  end


private
  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end


end
