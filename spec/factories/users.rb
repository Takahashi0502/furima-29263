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
    birthday              { '{1=>2000, 2=>1, 3=>2}' }
  end
end
