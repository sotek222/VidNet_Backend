class MessageSerializer < ActiveModel::Serializer
  attributes :id, :link, :sender_id, :content, :sender, :recipient
  has_one :inbox
end
