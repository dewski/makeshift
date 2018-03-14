class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :email, null: false
      t.string :github_uid, null: false
      t.string :github_token, null: false

      t.timestamps null: false
      t.index :login, unique: true
      t.index :github_uid, unique: true
    end
  end
end
