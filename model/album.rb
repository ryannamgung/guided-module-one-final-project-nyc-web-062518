class Album < ActiveRecord[5.1]
  has_many :songs
  belongs_to :artist
end
