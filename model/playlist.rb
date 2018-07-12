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
    #first is the artist
    artist_id_array = []
    song_id_array = []
    Playlist.all.each do |playlist|
      if playlist.name == name
        artist_id_array << playlist.artist_id
        song_id_array << playlist.song_id
      end
    end


    artist_songs = Array.new artist_id_array.uniq.length
    artist_songs = artist_songs.map do |index|
      index = []
    end

    artist_id_array.uniq.each_with_index do |value, index|
      artist_songs[index] << value
    end

    playlist_hash = {}

    while artist_id_array.length > 0 do
      artist_info = []
      song_info = []
      artist_id_array.each do |id|
        Artist.all.each do |artist|
          if artist.id == id
            artist_info << artist.id
            artist_info << artist.name
            # binding.pry
            break
          end
        end
        if artist_info.length > 0
          artist_id_array.shift
          break
        end
      end


      song_id_array.each do |id|
        Song.all.each do |song|
          if song.id == id
            song_info << song.id
            song_info << song.name
            break
          end
        end
        # binding.pry
        if song_info.length > 0
          song_id_array.shift
          break
        end
      end

      final_songs = []
      artist_songs.each_with_index do |element, index|
        if element.first == artist_info[0]
          artist_songs[index] << song_info[1]
          final_songs = artist_songs[index]
        end
      end

      playlist_hash[artist_info[1]] = final_songs
      # binding.pry
    end
    playlist_hash
    # binding.pry
  end
end
