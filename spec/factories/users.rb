FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"あべ"}
    first_name            {"たろう"}
    last_name_kana        {"アベ"}
    first_name_kana       {"タロウ"}
    birthday              {"1930-1-1"}
  end
end