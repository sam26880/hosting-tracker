require 'faker'

FactoryGirl.define do
  factory :customer do
    name Faker::Name.first_name
    expiration_date Date.parse('2012-10-20')
    notes Faker::Lorem.paragraph
    factory :invalid_customer do
      name nil
    end
  end
end
