# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    transient do
      game { create(:game) }
    end
    word { create(:word, game:) }
    round { nil }

    trait :completed do
      round
    end
  end
end
