class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :friend_a
      t.references :friend_b
    end
  end
end
