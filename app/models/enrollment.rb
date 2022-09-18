class Enrollment < ApplicationRecord
  extend FriendlyId
  friendly_id :buy_id, use: :slugged

  belongs_to :user, counter_cache: true
  belongs_to :course, counter_cache: true

  validates :user, :course, presence: true
  validates_presence_of :rating, if: :review
  validates_presence_of :review, if: :rating
  validates_uniqueness_of :course_id, scope: :user_id #user can not be subscribed to the same course twice
  validates_uniqueness_of :user_id, scope: :course_id #user can not be subscribed to the same course twice

  validate :cant_subscribe_to_own_course 

  scope :pending_review, -> {where(rating: [0, nil, ""], review: [0, nil, ""])}
  scope :reviewed, -> {where.not(rating: [0, nil, ""], review: [0, nil, ""])}
  scope :latest_review, -> {order(rating: :desc).limit(3)}

  def buy_id
    "enroll " + course.title + " " + user.email
  end

  after_save do
    unless rating.nil? || rating.zero?
      course.update_rating 
    end
  end

  after_destroy do
    course.update_rating
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
