class CreateTheatres < ActiveRecord::Migration[5.2]
  def change
    create_table :theatres do |t|
      t.integer :host_id
      t.string :src
      t.boolean :text_chat
      t.boolean :audio_chat
      t.boolean :video_chat

      t.timestamps
    end
  end
end
