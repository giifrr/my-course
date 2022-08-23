class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_variables
  after_action :user_activity

  include PublicActivity::StoreController
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search)
  end

  private

  def user_activity
    current_user.try :touch
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
