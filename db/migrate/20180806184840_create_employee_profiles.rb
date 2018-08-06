class CreateEmployeeProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_profiles do |t|
      t.references :user, foreign_key: true
      t.string :sex
      t.string :gender_identity
      t.string :ethnicity
      t.string :sexual_orientation
      t.string :age_group

      t.timestamps
    end
  end
end
