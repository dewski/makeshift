class AddPagerdutyUidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pagerduty_uid, :string, null: true
  end
end
