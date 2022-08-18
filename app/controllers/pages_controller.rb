class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ home ]
  def home
    @popular_courses = Course.all.limit(3)
    @most_recent = Course.all.order(created_at: :desc).limit(3)
  end

  def privacy_policy
  end
end
