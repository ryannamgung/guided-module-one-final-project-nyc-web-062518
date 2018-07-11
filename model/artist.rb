class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  def self.create_artist(input)
    Artist.create(name: input)
  end

  def self.delete
    Artist.delete_all
  end

end
