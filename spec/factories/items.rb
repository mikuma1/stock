FactoryBot.define do
  factory :item do
    name                  { 'sample item' }
    url                   { 'https://www.stock/' }
    category_id           { '1' }
    info                  { 'sample text' }
    stock_quantity        { '10' }
    standard_inventory    { '5' }
    ordering_unit         { '1' }
    price                 { '150' }
    place                 { '消耗品保管棚１段目' }
    association :organization

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
