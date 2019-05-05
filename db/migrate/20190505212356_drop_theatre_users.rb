class DropTheatreUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :theatre_users
  end
end
