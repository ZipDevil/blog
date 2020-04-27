class CreateJoinTableUsersForums < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :forums do |t|
      t.index [:user_id, :forum_id]
      t.index [:forum_id, :user_id]
    end
  end
end
