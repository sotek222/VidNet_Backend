class Message < ApplicationRecord
  belongs_to :inbox
  belongs_to :sender, class_name: "User", foreign_key: :sender_id


  def sender
    User.find(self.sender_id)
  end

  def recipient
    self.inbox.user
  end
end
