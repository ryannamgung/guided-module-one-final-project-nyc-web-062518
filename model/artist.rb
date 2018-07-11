class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  def self.create_artist(input)
    Artist.new(name: input)
  end

end
