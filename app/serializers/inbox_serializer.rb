class InboxSerializer < ActiveModel::Serializer
  attributes :id, :recieved_messages
  has_one :user
end
