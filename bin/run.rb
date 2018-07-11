require_relative '../config/environment'
require "pry"


  def gets_user_input
    puts "Enter Artist Name:"
    gets.chomp
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

  input = gets_user_input

  puts find_by_name(input)

  p Artist.create_artist(input)
