FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    last_name             {"あべ"}
    first_name            {"たろう"}
    last_name_kana        {"アベ"}
    first_name_kana       {"タロウ"}
  end
end