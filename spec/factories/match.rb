FactoryGirl.define do
  factory :match do
    team_a { Faker::Address.country }
    team_b { Faker::Address.country }
    start { Faker::Time.forward(23, :all) }
    win_a { Faker::Number.decimal(1, 2) }
    win_b { Faker::Number.decimal(1, 2) }
    tie { Faker::Number.decimal(1, 2) }
    win_tie_a { Faker::Number.decimal(1, 2) }
    win_tie_b { Faker::Number.decimal(1, 2) }
    not_tie { Faker::Number.decimal(1, 2) }

    trait :finished do
      start { Faker::Time.backward(23, :all) }
    end

    trait :tie do
      result_a { 2 }
      result_b { 2 }
    end

    trait :win_a do
      result_a { 2 }
      result_b { 1 }
    end

    trait :win_b do
      result_a { 1 }
      result_b { 2 }
    end
  end
end
