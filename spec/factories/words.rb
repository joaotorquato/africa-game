# frozen_string_literal: true

FactoryBot.define do
  factory :word do
    game
    name { Faker::House.furniture }
  end
end
