FactoryBot.define do
  factory :order_address do
    token { 'tok_XXXXXXXXXXXXXXXXX' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { 'アパート' }
    phone_num { '00000000000' }
  end
end
