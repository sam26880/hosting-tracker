require 'faker'

FactoryGirl.define do
  factory :customer do
    name Faker::Name.first_name
    expiration_date "2012-10-17"
    notes Faker::Lorem.paragraph
    factory :invalid_customer do
      name nil
    end
  end
end
