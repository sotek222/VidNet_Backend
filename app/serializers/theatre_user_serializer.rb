class TheatreUserSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :theatre
end
