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
  has_rich_text :description

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
  
end
