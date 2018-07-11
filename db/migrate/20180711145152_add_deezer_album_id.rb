class AddDeezerAlbumId < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :deezer_id, :integer
  end
end
