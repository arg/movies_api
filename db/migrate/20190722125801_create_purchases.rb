class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: { on_delete: :cascade }
      t.references :purchasable, type: :uuid, null: false, polymorphic: true
      t.integer :option, null: false
      t.timestamps
      t.datetime :expires_at, null: false, index: true
    end
  end
end
