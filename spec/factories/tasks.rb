require 'user'

FactoryGirl.define do
  factory :task do
    description  'Test task'
    state 'open'

    association :owner, factory: :user
    association :performer, factory: :user
  end
end
