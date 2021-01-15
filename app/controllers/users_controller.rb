class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.includes(:user)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def user_params
    params.permit(:nickname, :myinfo)
  end
end
