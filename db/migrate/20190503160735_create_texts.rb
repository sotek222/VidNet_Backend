class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.references :user, foreign_key: true
      t.references :chat, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
