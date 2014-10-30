FactoryGirl.define do
  factory :user do
    name                   "Chris Markel"
    email
    password               "foobar"
    password_confirmation  "foobar"
    phone                  "9999999999"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  factory :quote do
    content "Amateur doesn't mean rookie"
    ihq_id  "http://iheartquotes.com/fortune/show/1253"
    source  "Chris"
    user
  end
end