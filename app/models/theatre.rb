class Theatre < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: :host_id
  has_many :chats

  def chat
    self.chats.first
  end

  def host
    User.find(self.host_id)
  end
end
