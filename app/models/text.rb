class Text < ApplicationRecord
  belongs_to :user
  belongs_to :chat


  def sender
    User.find(self.user_id)
  end
end
