class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist


  def self.create_album(input)
    Album.new(name: input)
  end
end
