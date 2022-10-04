class CreateUserLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :user_lessons do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
