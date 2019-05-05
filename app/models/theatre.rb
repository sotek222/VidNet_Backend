class Theatre < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: :host_id
  has_many :chats
  has_many :theatre_users
  has_many :users, through: :theatre_users

  def chat
    self.chats.first
  end
end
