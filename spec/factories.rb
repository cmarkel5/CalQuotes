FactoryGirl.define do
  factory :user do
    name                   "Chris Markel"
    email
    password               "foobar"
    password_confirmation  "foobar"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end
end