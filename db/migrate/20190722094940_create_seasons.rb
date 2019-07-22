class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons, id: :uuid do |t|
      t.string :title, null: false, limit: 160
      t.string :plot, null: false, limit: 500
      t.timestamps
    end
  end
end
