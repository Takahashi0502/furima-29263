FactoryBot.define do
  factory :item do
    name             {Faker::Book.title}
    info             {Faker::Book.genre}
    category_id      {rand(2..11)}
    status_id        {rand(2..7)}
    delivery_fee_id  {rand(2..3)}
    shipping_area_id {rand(2..48)}
    shipping_days_id {rand(2..4)}
    price            {rand(300..9999999)}
    association      :user
  end
end
