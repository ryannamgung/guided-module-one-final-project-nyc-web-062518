class Song < ActiveRecord::Base
  belongs_to :album
  has_many :artist, through: :album

  def self.create_song(input)
    Song.new(name: input)
  end
end
