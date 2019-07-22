class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email, null: false, limit: 160
      t.timestamps
    end
    add_index :users, 'lower(email)', unique: true
  end
end
