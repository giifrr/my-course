class ChartsController < ApplicationController
  def users_created
    render json: User.group_by_day(:created_at).count
  end

  def courses_created
    render json: Course.group_by_day(:created_at).count
  end

  def enrollments_created 
    render json: Enrollment.group_by_day(:created_at).count
  end

  def course_popularity
    binding.break
    render json: Enrollment.joins(:course).group(:'courses.title').count
  end
end