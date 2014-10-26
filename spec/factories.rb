FactoryGirl.define do
  factory :user do
    name                   "Chris Markel"
    email                  "cmarkel5@gmail.com"
    password               "foobar"
    password_confirmation  "foobar"
  end
end