require_relative '../config/environment'
require "pry"
  #
  #

  puts "Enter an Artist name: "
  artist = Method.gets_user_input
  # binding.pry
  fan_count = Method.find_num_fans(artist)
  # binding.pry
  album_count = Method.find_num_albums(artist)
  # binding.pry
  if !Artist.exists?(name: artist)
    artist_instance = Artist.create_artist(artist, album_count, fan_count)
  else
    artist_instance = Artist.find_by(name: artist)
  end

    album_array = Method.find_by_name(artist)
    random_album = album_array.sample
    song_array = Method.find_songs(random_album, artist)
    # binding.pry
    album_id = Method.find_album_id(random_album, artist)

  song_array.each do |song|
    if !Song.exists?(name: song)
     song_instance = Song.create_song(song, album_id)
     Album.create_album(artist_instance.id, song_instance.id, random_album, song_instance.deezer_album_id)
   end
  end
  # # # binding.pry
  # p Album.all
