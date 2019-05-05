class TextSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender
end
