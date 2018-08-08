class AddTypeToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :vote_type, :string
  end
end
