FactoryBot.define do
  factory :order_address do
    post_number      { '561-0831'}
    area_id          { 23 }
    city             { '豊中市' }
    street_number    { '1' }
    building_name    { '1' }
    phone_number     { '09000000000'}
    token            { 'tok_abcdefghijk00000000000000000'}
  end
end
