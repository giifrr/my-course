class Lesson < ApplicationRecord
  belongs_to :course, counter_cache: true
  has_rich_text :content
end
