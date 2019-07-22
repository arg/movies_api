class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes, id: :uuid do |t|
      t.references :season, type: :uuid, foreign_key: { on_delete: :cascade }
      t.string :title, null: false, limit: 160
      t.string :plot, null: false, limit: 500
      t.timestamps
    end
  end
end
