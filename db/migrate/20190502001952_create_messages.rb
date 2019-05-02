class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :inbox, foreign_key: true
      t.integer :sender_id
      t.string :link
      t.text :content

      t.timestamps
    end
  end
end
