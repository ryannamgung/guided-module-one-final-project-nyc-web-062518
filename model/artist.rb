class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  def self.create_artist(input, album_count, fan_count)
    Artist.create(name: input, num_of_albums: album_count, num_of_fans: fan_count)
  end

  def self.delete
    Artist.delete_all
  end

  def self.most_popular
    max_fans = Artist.maximum(:num_of_fans)
    artist = Artist.find_by(num_of_fans: max_fans)
    artist.name
  end

  def self.most_albums
    max_albums = Artist.maximum(:num_of_albums)
    artist = Artist.find_by(num_of_albums: max_albums)
    artist.name
  end
end
