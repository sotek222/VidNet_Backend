class AddIsPublicToTheatres < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :is_public, :boolean
  end
end
