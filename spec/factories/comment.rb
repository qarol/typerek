FactoryGirl.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    created_at { Faker::Time.backward(30, :evening) }

    association :user
    association :match
  end
end
