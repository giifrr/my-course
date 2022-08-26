class UsersController < ApplicationController 
  before_action :set_user, only: %i[ edit update ]
  
  def index
    @user_ransack = User.ransack(params[:user_search], search_key: :user_search)
    @users = @user_ransack.result(distinct: true)
    authorize @users
  end

  def edit
    authorize @user
  end

  def update
    authorize @user 
    
    if @user.update(user_params)
      flash[:notice] = "Roles updated successfully."
      redirect_to users_path
    else
      flash.now[:alert] = "Failed to change the role."
      render :edit
    end
  end

  private 

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(role_ids: [])
    end
end
