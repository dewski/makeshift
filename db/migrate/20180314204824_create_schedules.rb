class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :pagerduty_id, null: false

      t.timestamps null: false

      t.index :pagerduty_id, unique: true
    end
  end
end
