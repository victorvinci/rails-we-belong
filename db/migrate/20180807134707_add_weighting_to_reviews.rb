class AddWeightingToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :weighting, :integer
  end
end
