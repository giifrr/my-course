class UsersController < ApplicationController
  def index
    @user_ransack = User.ransack(params[:user_search], search_key: :user_search)
    @users = @user_ransack.result(distinct: true)
  end
end
