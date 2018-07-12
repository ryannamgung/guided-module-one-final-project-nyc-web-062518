class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  def self.create_artist(input, album_count, fan_count)
    Artist.create(name: input, num_of_albums: album_count, num_of_fans: fan_count)
  end

  def self.delete
    Artist.delete_all
  end

  def self.most_popular
    max_fans = Artist.maximum(:num_of_fans)
    artist = Artist.find_by(num_of_fans: max_fans)
    artist.name
  end

  def self.most_albums
    max_albums = Artist.maximum(:num_of_albums)
    artist = Artist.find_by(num_of_albums: max_albums)
    artist.name
  end

  def self.all_albums(artist)
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
