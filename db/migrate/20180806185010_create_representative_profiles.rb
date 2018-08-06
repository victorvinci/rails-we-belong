class CreateRepresentativeProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :representative_profiles do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
