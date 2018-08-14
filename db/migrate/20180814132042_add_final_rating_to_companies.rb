class AddFinalRatingToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :final_rating, :Integer
  end
end
