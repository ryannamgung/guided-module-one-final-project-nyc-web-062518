class Song < ActiveRecord::Base
  belongs_to :album
  has_many :artist, through: :album
end
