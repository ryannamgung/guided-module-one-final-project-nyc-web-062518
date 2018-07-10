require "json"
require "rest-client"
require 'pry'

# url = 'https://api.deezer.com/chart/0/tracks'
# response = RestClient.get(url)
# stringy_json = response.body
#  result = JSON.parse(stringy_json)
#  p result["data"][0]["title"]
# p result["data"][0]["artist"]["name"]
#  p result["data"][0]["album"]["id"]
#  p result["data"][0]["explicit_lyrics"]
#  p result["data"][0]["artist"]["id"]


# artist info find by ID
# url = 'https://api.deezer.com/artist/246791'
# response = RestClient.get(url)
# stringy_json = response.body
#  result = JSON.parse(stringy_json)
# p result["nb_fan"]
# p result["nb_album"]


# url = 'https://api.deezer.com/album/67145722'
# response = RestClient.get(url)
# stringy_json = response.body
#  result = JSON.parse(stringy_json)
#  my_array = []
#  result["tracks"]["data"].each do |song|
#   my_array << song["title"]
# end
# p my_array
