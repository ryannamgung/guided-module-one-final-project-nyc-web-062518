class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist


  def self.create_album(artist_id, song_id, name, deezer_album_id)
    Album.create(artist_id: artist_id, song_id: song_id, name: name, deezer_id: deezer_album_id)
  end

  def self.delete
    Album.delete_all
  end


end
