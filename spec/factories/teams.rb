# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    game
    name { Faker::Sports::Football.team }
  end
end
