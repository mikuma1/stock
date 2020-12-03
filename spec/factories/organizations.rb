FactoryBot.define do
  factory :organization do
    name                  { Faker::Name.initials(number: 2) }
    password              { 'aaa111' }
    password_confirmation { password }
  end
end
