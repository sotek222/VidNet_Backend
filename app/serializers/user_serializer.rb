class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image, :location, :friendees, :frienders

end
