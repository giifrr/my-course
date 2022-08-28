class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user, :course, presence: true
  validates_uniqueness_of :course_id, scope: :user_id #user can not be subscribed to the same course twice
  validates_uniqueness_of :user_id, scope: :course_id #user can not be subscribed to the same course twice

  validate :cant_subscribe_to_own_course 

  private
    def cant_subscribe_to_own_course
      if self.new_record?
        if user_id == course.user_id
          errors.add(:base, "You not subscribe to your own course")
        end
      end
    end
end
