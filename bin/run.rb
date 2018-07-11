require_relative '../config/environment'
require "pry"


  def gets_user_input
    array_names = gets.chomp.split(" ").map do |name|
      name.downcase.capitalize
    end
    array_names.join(" ")
  end

  def find_by_name(artist)
    albums = []
    input = artist
    url = 'https://api.deezer.com/search/album?q='+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)
    result["data"].each do |info_hash|
      albums << info_hash["title"]
    end
    albums.uniq
  end

  def find_songs(album, artist_name)
    albums = []
    input = album
    url = 'https://api.deezer.com/search/album?q='+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)

    new_url = ''
    result["data"].find {|info_hash|
      if info_hash["artist"]["name"] == artist_name
        new_url = info_hash["tracklist"]
      end
    }
    # binding.pry
    ##########################################
    new_response = RestClient.get(new_url)
    new_stringy_json = new_response.body
    new_result = JSON.parse(new_stringy_json)
    songs = []
    new_result["data"].each do |info_hash|
      songs << info_hash["title"]
    end
    songs
  end

  def find_album_id(album, artist_name)
    albums = []
    input = album
    url = 'https://api.deezer.com/search/album?q='+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)

    album_id = ''
    result["data"].find {|info_hash|
      if info_hash["artist"]["name"] == artist_name
        album_id = info_hash["id"]
      end
    }
    album_id
  end


  #
  #
  puts "Enter an Artist name: "
  artist = gets_user_input
  if !Artist.exists?(name: artist)
    artist_instance = Artist.create_artist(artist)
  else
    artist_instance = Artist.find_by(name: artist)
  end
    album_array = find_by_name(artist)
    random_album = album_array.sample
    song_array = find_songs(random_album, artist)
    # binding.pry
    album_id = find_album_id(random_album, artist)

  song_array.each do |song|
    if !Song.exists?(name: song)
     song_instance = Song.create_song(song, album_id)
     Album.create_album(artist_instance.id, song_instance.id, random_album, song_instance.deezer_album_id)
   end
  end
  # # binding.pry
  p Album.all
  # Album.delete
  # Song.delete
  # Artist.delete
