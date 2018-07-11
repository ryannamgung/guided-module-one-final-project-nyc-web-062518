class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  def self.create_artist(input, album_count, fan_count)
    Artist.create(name: input, num_of_albums: album_count, num_of_fans: fan_count)
  end

  def self.delete
    Artist.delete_all
  end

end
