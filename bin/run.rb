require_relative '../config/environment'
require "pry"

def welcome
  puts "Hello, welcome to the Music Database."
end

def gets_user_input
  gets.chomp.downcase
end

def find_by_name(artist)
  # Artist.find, and if not, then make the call to the API
  input = artist
  url = 'https://api.deezer.com/search/album?q='+input
  response = RestClient.get(url)
  stringy_json = response.body
  result = JSON.parse(stringy_json)
  array = []
  result["data"].each do |info_hash|
    array << info_hash["title"]
  end
  array = array.uniq
  array
end

puts "enter a artist name"
artist = gets_user_input

p find_by_name(artist)

# welcome
# puts "Please enter a group (a,b,c,d,e,f): "
#
# input = gets_user_input
# best_team_in_group(input)
#
# puts "Enter 'y' if you wish to see the best team in all brackets, else press enter."
# input = gets_user_input
# if input == 'y'
#   best_team
# end
#
# puts "Enter 'y' if you wish to see the team with the most points, else press enter."
#
# input = gets_user_input
# if input == 'y'
#   team_with_most_points
# end
#
# puts
