class User < ApplicationRecord
  has_secure_password

  has_many :theatres, foreign_key: "host_id", class_name: "Theatre", dependent: :destroy
  has_many :texts, dependent: :destroy

  has_many :messages, foreign_key: "sender_id", class_name: "Message", dependent: :destroy
  has_many :inboxes, dependent: :destroy

  has_many :friendered_users, foreign_key: :friender_id, class_name: 'Friend', dependent: :destroy
  has_many :friendees, through: :friendered_users

  has_many :friending_users, foreign_key: :friendee_id, class_name: 'Friend', dependent: :destroy
  has_many :frienders, through: :friending_users

  def sent_messages
    self.messages
  end

  # def friend_ships
  #   Friend.all.select do |fs|
  #     fs.friender_id == self.id
  #   end
  # end

  def inbox
    self.inboxes.first
  end

  def received_messages
    self.inbox.messages
  end

end
