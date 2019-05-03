class InboxSerializer < ActiveModel::Serializer
  attributes :id, :received_messages
  has_one :user
end
