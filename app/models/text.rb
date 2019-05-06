class Text < ApplicationRecord
  belongs_to :chat
  belongs_to :user

  def sender
    User.find(self.user_id)
  end

end
