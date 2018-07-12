class Song < ActiveRecord::Base
  belongs_to :album
  has_many :artist, through: :album

  def self.create_song(name, album_id)
    Song.create(name: name, deezer_album_id: album_id)
  end

  def self.delete
    Song.delete_all
  end

  def self.all_songs(artist)
    artist = Method.input(artist)
    artist_id = Playlist.get_artist_id(artist)
    # binding.pry
    album_deezer_id = Album.all.map do |album|
      if album.artist_id == artist_id
        album.deezer_id
      end
    end
    deezer_ids = album_deezer_id.uniq.compact
    song_array = []
    Song.all.each do |song|
      deezer_ids.each do |id|
        if song.deezer_album_id == id
          song_array << song.name
        end
      end
    end
     song_array
  end

end
