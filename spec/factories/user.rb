FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password 'pa$$word'
    email { nil }
    admin { false }
    fin { false }

    trait :admin do
      admin { true }
    end

    trait :fin do
      fin { true }
    end
  end
end
