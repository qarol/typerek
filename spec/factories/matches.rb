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
  end
end
