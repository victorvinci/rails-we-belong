class AddIndustryToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :industry, foreign_key: true
  end
end
