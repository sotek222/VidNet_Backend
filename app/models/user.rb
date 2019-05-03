class User < ApplicationRecord
  has_secure_password
# Friendships self join
  has_many :friendered_users, foreign_key: :friender_id, class_name: 'Friend'
  has_many :friendees, through: :friendered_users

  has_many :friending_users, foreign_key: :friendee_id, class_name: 'Friend'
  has_many :frienders, through: :friending_users
# has many through between user and theatre
  has_many :theatre_users
  has_many :theatres, through: :theatre_users

# User has many theatres as a host_id
  has_many :theatres, dependent: :destroy

  has_many :inboxes, dependent: :destroy
  has_many :messages, foreign_key: "sender_id", class_name: "Message"

  def sent_messages
    self.messages
  end

  def friend_ships
    Friend.all.select do |fs|
      fs.friender_id == self.id
    end
  end

  def inbox
    self.inboxes.first
  end

  def received_messages
    self.inbox.messages
  end

end
