class AddVolumeToTheatres < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :volume, :float
  end
end
