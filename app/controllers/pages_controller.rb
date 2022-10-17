class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ home ]
  
  def home
    @top_rated_courses = Course.top_rated_courses
    @popular_courses = Course.popular_courses
    @most_recent = Course.most_recent
    @purchased_courses = Course.joins(:enrollments).where(enrollments: {user: current_user}).limit(3)
    @top_reviewed_course = Enrollment.reviewed.latest_review
  end

  def activity 
    @activities = PublicActivity::Activity.all
  end

  def analytics
    if current_user.has_role?(:admin)
      
    else
      redirect_to root_path
    end
  end
end
