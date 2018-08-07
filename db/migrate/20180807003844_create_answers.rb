class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :importance_1
      t.integer :weighting_1
      t.integer :answer_1
      t.integer :importance_2
      t.integer :weighting_2
      t.integer :answer_2
      t.integer :importance_3
      t.integer :weighting_3
      t.integer :answer_3
      t.integer :importance_4
      t.integer :weighting_4
      t.integer :answer_4
      t.integer :importance_5
      t.integer :weighting_5
      t.integer :answer_5
      t.boolean :minority
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
