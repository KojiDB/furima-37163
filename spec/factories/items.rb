FactoryBot.define do
  factory :item do
    name               { '太田胃酸' }
    introduction       { 'いい薬です' }
    category_id        { 2 }
    item_conditions_id { 2 }
    area_id            { 2 }
    postage_fee_id     { 2 }
    postage_day_id     { 2 }
    price              { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
