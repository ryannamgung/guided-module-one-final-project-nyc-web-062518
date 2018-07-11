class Artist < ActiveRecord::Base
  has_many :albums
  has_many :songs, through: :albums

  # Artist.create(name: result[]"name"], )
end
