class CreateScheduleInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :schedule_invitations do |t|
      t.integer :creator_id, null: false
      t.integer :user_id, null: false
      t.integer :schedule_id, null: false

      t.timestamps null: false

      t.index :user_id
      t.index [:schedule_id, :user_id], unique: true
    end
  end
end
