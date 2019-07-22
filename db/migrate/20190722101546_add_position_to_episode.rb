class AddPositionToEpisode < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :position, :integer, null: false
  end
end
