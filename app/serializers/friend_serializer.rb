class FriendSerializer < ActiveModel::Serializer
  attributes :id, :friender_id, :friendee_id, :friendee, :friender
end
