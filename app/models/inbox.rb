class Inbox < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  def received_messages
    self.messages
  end
end
