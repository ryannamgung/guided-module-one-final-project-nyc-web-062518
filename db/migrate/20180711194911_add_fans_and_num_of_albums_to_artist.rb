class AddFansAndNumOfAlbumsToArtist < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :num_of_albums, :integer
    add_column :artists, :num_of_fans, :integer
  end
end
