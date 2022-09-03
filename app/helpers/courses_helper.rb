module CoursesHelper
  def enroll_button(user, course)
    if user
      if course.user == user
        link_to "Your create this course. Go to analytics", course
      elsif course.enrollments.where(user_id: user.id, course_id: course.id).any?
        link_to "Go to course", course 
      else  
        link_to number_to_currency(course.price), course_enrollments_path(course), class: "btn btn-success btn-sm"
      end
    else
      link_to  number_to_currency(course.price), course_enrollments_path(course), class: "btn btn-success btn-sm"
    end
  end
end
