FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.email }
    password              { 'aaa111' }
    password_confirmation { password }
    family_name { '伊藤' }
    name { '花子' }
    kana_family_name { 'イトウ' }
    kana_name { 'ハナコ' }
    birthday { '2020-01-01' }
  end
end
