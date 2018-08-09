class AddDiversityScoresToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :answer_1_total_score, :integer
    add_column :companies, :answer_1_average_score, :integer
    add_column :companies, :answer_2_total_score, :integer
    add_column :companies, :answer_2_average_score, :integer
    add_column :companies, :answer_3_total_score, :integer
    add_column :companies, :answer_3_average_score, :integer
    add_column :companies, :answer_4_total_score, :integer
    add_column :companies, :answer_4_average_score, :integer
    add_column :companies, :answer_5_total_score, :integer
    add_column :companies, :answer_5_average_score, :integer
  end
end
