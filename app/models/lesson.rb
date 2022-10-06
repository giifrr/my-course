class Lesson < ApplicationRecord
  belongs_to :course, counter_cache: true
  has_rich_text :content
  has_many :user_lessons, dependent: :destroy

  def view_lesson(user)
    if UserLesson.where(user: user, lesson: self).empty? && self.course.user != user
      self.user_lessons.create(user: user, lesson: self)
    end
  end

  def viewed?(user)
    self.user_lessons.where(user: user, lesson: self).any?
  end
end
