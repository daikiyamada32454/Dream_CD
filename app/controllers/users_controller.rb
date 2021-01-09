class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.includes(:user)
  end

end
