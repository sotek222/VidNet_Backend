class Inbox < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy


  def recieved_messages
    self.messages
  end
end
