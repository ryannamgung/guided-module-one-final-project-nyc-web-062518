class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist, through: :album
end
