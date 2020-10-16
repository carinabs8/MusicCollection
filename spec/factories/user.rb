FactoryBot.define do
  factory :user do
    username  {"admin"}
    password {"abc,123"}
    fullname {"Admin 123"}
    password_confirmation {"abc,123"}
    role {"admin"}
  end
end
