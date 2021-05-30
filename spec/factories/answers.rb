# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    match
    user
    result { %i[win_a tie win_b win_tie_a win_tie_b not_tie].sample }
  end
end
