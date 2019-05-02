class MessageSerializer < ActiveModel::Serializer
  attributes :id, :link, :user_id, :content, :sender, :recipient
  has_one :inbox
end
