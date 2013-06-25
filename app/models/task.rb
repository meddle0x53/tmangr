class Task < ActiveRecord::Base
  attr_accessible :description, :state, :owner_id, :performer_id, :owner
  
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :performer, class_name: 'User', foreign_key: 'performer_id'
end
