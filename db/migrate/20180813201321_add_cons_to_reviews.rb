class AddConsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :cons, :text
    rename_column :reviews, :content, :pros
  end
end
