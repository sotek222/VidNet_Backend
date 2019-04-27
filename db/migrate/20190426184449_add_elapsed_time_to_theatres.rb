class AddElapsedTimeToTheatres < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :elapsed_time, :integer
  end
end
