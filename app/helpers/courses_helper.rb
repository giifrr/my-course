module CoursesHelper
  def enroll_button(user, course)
    if user
      if course.user == user
        link_to "Go to analytics", course, class: "btn-primary btn-sm btn"
      elsif course.enrollments.where(user_id: user.id, course_id: course.id).any?
        link_to "Go to course", course, class: "btn btn-secondary btn-sm" 
      else  
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: "btn btn-success btn-sm"
      end
    else
      link_to  number_to_currency(course.price), new_course_enrollment_path(course), class: "btn btn-success btn-sm"
    end
  end

  def review_button(user, course)
    user_course = course.enrollments.where(user: user)
    if user
      if user_course.any? 
        if user_course.pending_review.any?
          link_to "Add Review", edit_course_enrollment_path(user_course.first.course_id, user_course.first.id), class: "btn btn-primary btn-sm"
        else
          link_to "See your review", enrollment_path(user_course.first), class: "btn btn-primary btn-sm"  
        end
      end
    end
  end
end
