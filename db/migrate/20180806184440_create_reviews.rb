class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.text :content
      t.string :user_position
      t.string :user_area

      t.timestamps
    end
  end
end
