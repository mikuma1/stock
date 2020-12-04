FactoryBot.define do
  factory :order do
    quantity { '10' }
    association :item
    association :user
  end
end
