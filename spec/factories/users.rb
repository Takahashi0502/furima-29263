FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name_kanji     { 'テスト' }
    first_name_kanji      { '太郎' }
    family_name_kana      { 'テスト' }
    first_name_kana       { 'タロウ' }
    birthday              { '2010-01-01' }
  end
end
