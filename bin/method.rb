class Method
  # def self.prompt
  #   puts "Enter an artist's name"
  # end
  def self.gets_user_input
    array_names = gets.chomp.split(" ").map do |name|
      name.downcase.capitalize
    end
    array_names.join(" ")
  end

  def self.find_by_name(artist)
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

  def self.find_songs(album, artist_name)
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

  def self.find_album_id(album, artist_name)
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

  def self.find_num_fans(artist)
    fans = nil
    input = artist.split(" ")[0]
    url = 'https://api.deezer.com/artist/'+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)
    result.each do |key, value|
      if key == "nb_fan"
        fans = value
      end
    end
    fans
  end

  def self.find_num_albums(artist)
    albums = nil
    input = artist.split(" ")[0]
    url = 'https://api.deezer.com/artist/'+input
    response = RestClient.get(url)
    stringy_json = response.body
    result = JSON.parse(stringy_json)
    result.each do |key, value|
      if key == "nb_album"
        albums = value
      end
    end
    albums
  end
end
