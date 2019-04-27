class AddPlayingToTheatres < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :playing, :boolean
  end
end
