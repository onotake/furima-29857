FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"test0000"}
    password_confirmation {password}
    first_name            {"武"}
    last_name             {"小野原"}
    first_name_kana       {"タケル"}
    last_name_kana        {"オノハラ"}
    birth_date            {"1992-05-27"}
  end
end