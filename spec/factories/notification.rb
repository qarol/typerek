FactoryGirl.define do
  factory :notification do
    content { Faker::Hipster.paragraph(2) }
    display false

    trait :displayed do
      display true
    end
  end
end
