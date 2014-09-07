class AddUserIdToBetties < ActiveRecord::Migration
  def change
    add_column :betties, :user_id, :integer
    add_index :betties, :user_id
  end
end
