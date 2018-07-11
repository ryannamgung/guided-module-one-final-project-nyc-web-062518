class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.integer :song_id
      t.string :name
    end
  end
end
