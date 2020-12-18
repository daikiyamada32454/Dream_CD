class TweetsController < ApplicationController
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @tweets = Tweet.all
  end

  def show
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:image, :description,:play).merge(user_id: current_user.id)
  end
end
