class Song < ActiveRecord[5.1]
  belongs_to :album
  belongs_to :artist through: :album
end
