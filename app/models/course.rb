class Course < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :short_description, :language, :price, presence: true
  validates :description, presence: true, length: {minimum: 5}
  validates_uniqueness_of :title 

  belongs_to :user, counter_cache: true
  has_many :lessons, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :user_lessons, through: :lessons
  has_rich_text :description

  scope :top_rated_courses, -> {all.limit(3).order(average_rating: :desc)}
  scope :most_recent, -> { all.order(created_at: :desc).limit(3) }
  scope :popular_courses, -> {all.order(enrollments_count: :desc).limit(3)}
  
  LANGUAGES = [:"English", :"Indonesia", :"French"] 
  def self.language
    LANGUAGES.map {|language|[language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map {|level| [level, level] }
  end

  def bought(user)
    self.enrollments.where(user_id: [user.id], course_id: [self.id].empty?)
  end

  def update_rating
    if enrollments.where.not(rating: nil).any?
      update_column :average_rating, (enrollments.average(:rating).round(2).to_f)
    else
      update_column :average_rating, (0)
    end
  end

  def progress(user)
    if self.lessons_count > 0
      user_lessons.where(user: user).count / self.lessons_count.to_f*100
    end
  end
  
end
