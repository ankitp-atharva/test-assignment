class CreateFollowUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_users do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :follower_id, null: false

      t.timestamps
    end
  end
end
