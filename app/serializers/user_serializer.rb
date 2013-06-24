class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :email
end
