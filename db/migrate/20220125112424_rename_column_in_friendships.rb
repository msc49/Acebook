class RenameColumnInFriendships < ActiveRecord::Migration[6.1]
  def change
    rename_column :friendships, :user_1_id, :user_id
    rename_column :friendships, :user_2_id, :friend_id
  end
end
