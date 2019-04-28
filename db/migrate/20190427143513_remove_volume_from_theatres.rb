class RemoveVolumeFromTheatres < ActiveRecord::Migration[5.2]
  def change
    remove_column :theatres, :volume
  end
end
