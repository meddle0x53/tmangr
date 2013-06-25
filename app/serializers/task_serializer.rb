class TaskSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :description, :state, :created_at
  has_one :owner, embed: :object 
  has_one :performer, embed: :object 
end
