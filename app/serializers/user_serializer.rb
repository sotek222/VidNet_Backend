class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image, :location, :friendees, :frienders, :friend_ships, :sent_messages, :received_messages, :inbox

end
