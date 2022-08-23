class CreateLesssons < ActiveRecord::Migration[7.0]
  def change
    create_table :lesssons do |t|
      t.string :title
      t.text :content
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
