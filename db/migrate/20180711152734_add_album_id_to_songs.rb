class AddAlbumIdToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :deezer_album_id, :integer
  end
end
