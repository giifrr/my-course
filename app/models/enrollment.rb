class Enrollment < ApplicationRecord
  extend FriendlyId
  friendly_id :to_s, use: :slugged

  belongs_to :user
  belongs_to :course

  validates :user, :course, presence: true
  validates_uniqueness_of :course_id, scope: :user_id #user can not be subscribed to the same course twice
  validates_uniqueness_of :user_id, scope: :course_id #user can not be subscribed to the same course twice

  validate :cant_subscribe_to_own_course 

  scope :pending_review, -> {where(rating: [0, nil, ""], review: [0, nil, ""])}

  def to_s 
    "enroll" + " " + user.to_s + " " + course.to_s
  end

  private
    def cant_subscribe_to_own_course
      if self.new_record?
        if user_id == course.user_id
          errors.add(:base, "You not subscribe to your own course")
        end
      end
    end
end
