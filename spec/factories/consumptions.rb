FactoryBot.define do
  factory :consumption do
    quantity { '10' }
    association :item
    association :user
  end
end
