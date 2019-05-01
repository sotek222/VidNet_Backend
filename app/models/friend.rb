class Friend < ApplicationRecord
  belongs_to :friender, class_name: 'User'
  belongs_to :friendee, class_name: 'User'

  def friendee
    User.find(self.friendee_id)
  end

  def friender
    User.find(self.friender_id)
  end

end
