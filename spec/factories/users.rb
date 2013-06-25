
FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@tmangr.com"
  end

  factory :user do
    email
    password  '123456'
  end
end
