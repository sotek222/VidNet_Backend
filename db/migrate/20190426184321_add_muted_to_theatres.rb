class AddMutedToTheatres < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :muted, :boolean
  end
end
