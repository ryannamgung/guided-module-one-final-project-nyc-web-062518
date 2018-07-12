require "pry"
class Playlist < ActiveRecord::Base
  has_many :songs
  has_many :artists


  def self.get_artist_id(artist)
    artists = artist.split(" ").map do |name|
      name.downcase.capitalize
    end
    artist = artists.join(" ")
    # binding.pry
    artist_name = Artist.find_by(name: artist)
    # binding.pry
    if artist_name
      artist_name.id
    else
      puts "artist is not within our records"
    end
  end

  def self.get_song_id(song)
    songs = song.split(" ").map do |name|
      name.downcase.capitalize
    end
    song = songs.join(" ")
    song_name = Song.find_by(name: song)
    if song_name
      song_name.id
    else
      puts "song is not within our records"
    end
  end

  def self.create_playlist(name, artist, song)
    Playlist.create(name: name, artist_id: artist, song_id: song)
  end

  def self.show_playlist(name)
    song_hash = Hash.new
    song_id = []
    artist_id = []
    Playlist.all.each do |playlist|
      if playlist.name == name
        song_hash[playlist.artist_id] = playlist.song_id
      end
    end

    song_hash.update do |artist_id, song_id|
      Artist.all.each do |artist|
        if artist.id == artist_id
          artist_id = artist.name
        end
      end
      binding.pry
    #   Song.all.each do |song|
    #     if song.id == song_id
    #       song_id = song.name
    #     end
    #   end
    # end
    end
  end
end
