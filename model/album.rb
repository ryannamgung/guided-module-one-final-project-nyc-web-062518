class Album < ActiveRecord::Base
  has_many :songs
  belongs_to :artist


  def create_album
    Album.create()
  end
end
