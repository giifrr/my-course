module CoursesHelper
  def enroll_button(user, course)
    if user
      if course.user == user
        link_to "Your create this course. Go to analytics", course
      elsif course.enrollments.where(user_id: user.id, course_id: course.id).any?
        link_to "Go to course", course 
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
          link_to "Add Review", edit_course_enrollment_path(user_course.first.course_id, user_course.first.id)
        else
          link_to "You have already reviewing this course"  
        end
      end
    end
  end
end
