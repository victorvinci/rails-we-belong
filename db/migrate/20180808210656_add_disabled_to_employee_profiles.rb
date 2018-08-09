class AddDisabledToEmployeeProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_profiles, :disability, :string
  end
end
