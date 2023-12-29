# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    name { 'First Game' }
    uuid { SecureRandom.uuid }

    trait :setup_completed do
      after :create do |game, _evaluator|
        create_list(:team, 3, game:)
        create_list(:word, 10, game:)
        game.setup!
      end
    end
  end
end
