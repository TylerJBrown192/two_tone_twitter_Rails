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
    if @tweet.save
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js { flash.now[:notice] = "Thanks for tweeting!" }
        # flash.now necessary for AJAX loading
        # of notification and not having it persist through html requests
      end
    else
      render :new
    end
  end


private
  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end


end
