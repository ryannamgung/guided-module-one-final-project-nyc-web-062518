class Song < ActiveRecord::Base
  belongs_to :album
  has_many :artist, through: :album

  def self.create_song(name, album_id)
    Song.create(name: name, deezer_album_id: album_id)
  end

  def self.get_first_artist
    artists.first
  end

end
