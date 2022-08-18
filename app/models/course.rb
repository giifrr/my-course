class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :short_description, :language, :price, presence: true
  validates :description, presence: true, length: {minimum: 5}

  belongs_to :user 

  has_rich_text :description

  LANGUAGES = [:"English", :"Indonesia", :"French"]
  def self.language
    LANGUAGES.map {|language| }
  end
end
