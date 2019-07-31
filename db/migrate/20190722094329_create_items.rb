class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :uuid do |t|
      t.string :type, null: false, index: true
      t.string :title, null: false, limit: 160
      t.string :plot, null: false, limit: 500
      t.timestamps
    end
  end
end
