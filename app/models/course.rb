class Course < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :short_description, :language, :price, presence: true
  validates :description, presence: true, length: {minimum: 5}

  belongs_to :user 

  has_rich_text :description

  LANGUAGES = [:"English", :"Indonesia", :"French"]
  def self.language
    LANGUAGES.map {|language|[language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map {|level| [level, level] }
  end
  
end
