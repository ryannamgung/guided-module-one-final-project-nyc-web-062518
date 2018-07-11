require_relative '../config/environment'
require "pry"


  def gets_user_input
    gets.chomp.downcase
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
    input = album.capitalize
    url = 'https://api.deezer.com/search/album?q='+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)
    new_url = ''
    result["data"].find {|info_hash|
      if info_hash["artist"]["name"] == artist_name.capitalize
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
    # binding.pry
  end

  def find_album_id(album, artist_name)
    albums = []
    input = album.capitalize
    url = 'https://api.deezer.com/search/album?q='+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)
    album_id = ''
    result["data"].find {|info_hash|
      if info_hash["artist"]["name"] == artist_name.capitalize
        album_id = info_hash["id"]
      end
    }
    album_id
  end




  puts "Enter Artist Name:"
  artist = gets_user_input
  Artist.create_artist(artist)
  album_array = find_by_name(artist)

  puts "Enter the full artist name:"
  artist_name = gets_user_input
  song_array = find_songs(album_array[0], artist_name)
  album_id = find_album_id(album_array[0], artist_name)
  p Song.create_song(song_array[0], album_id)
