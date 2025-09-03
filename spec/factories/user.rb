FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'abc123' }
    password_confirmation { 'abc123' }
    first_name { '陸太郎' }
    last_name { '山田' }
    first_name_kana { 'リクタロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { Faker.date.birthday }
  end
end
