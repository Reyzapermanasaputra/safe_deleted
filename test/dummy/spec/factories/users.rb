FactoryBot.define do
  factory :user do
    name { 'test' }
    trait :active do
      is_active { true }
    end

    trait :inactive do
      is_active { false }
    end
  end
end
