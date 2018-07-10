class Artist < ActiveRecord[5.1]
  has_many :albums
  has_many :songs, through: :albums

  def find_by_name(name)
    input = name
    url = 'https://api.deezer.com/search?q='+input
    # binding.pry
    response = RestClient.get(url)
    stringy_json = response.body
     result = JSON.parse(stringy_json)
    p result["data"][0]["title"]
  end
end
