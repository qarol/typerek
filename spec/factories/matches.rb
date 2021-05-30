# frozen_string_literal: true

FactoryBot.define do
  factory :match do
    team_a { Faker::Address.country }
    team_b { Faker::Address.country }
    start { Faker::Time.forward(days: 1) }
    win_a { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    win_b { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    tie { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    win_tie_a { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    win_tie_b { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    not_tie { Faker::Number.decimal(l_digits: 1, r_digits: 2) }
    result_a { Faker::Number.number(digits: 1) }
    result_b { Faker::Number.number(digits: 1) }

    trait :without_results do
      result_a { nil }
      result_b { nil }
    end

    trait :winner_a do
      result_a { 1 }
      result_b { 0 }
    end

    trait :winner_b do
      result_a { 0 }
      result_b { 1 }
    end

    trait :tie do
      result_a { 0 }
      result_b { 0 }
    end

    trait :start_in_past do
      start { Faker::Time.backward(days: 1) }
    end

    trait :start_in_future do
      start { Faker::Time.forward(days: 1) }
    end
  end
end
