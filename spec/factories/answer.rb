FactoryGirl.define do
  factory :answer do
    result { Faker::Number.between(0, 5) }

    association :user
    association :match
  end
end
