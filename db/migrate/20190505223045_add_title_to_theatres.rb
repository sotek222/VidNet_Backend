class AddTitleToTheatres < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :title, :string
  end
end
