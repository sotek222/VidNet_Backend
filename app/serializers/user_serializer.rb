class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image, :sent_messages, :received_messages, :inbox
  has_many :friendees
  has_many :frienders
end
