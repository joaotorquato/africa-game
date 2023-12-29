# frozen_string_literal: true

FactoryBot.define do
  factory :round do
    transient do
      game { create(:game) }
    end
    team { create(:team, game:) }
    start_time { nil }
    end_time { nil }
    kind { :first_round }

    trait :started do
      kind { :first_round }
      start_time { Time.current }
    end

    trait :ended do
      kind { :first_round }
      start_time { Time.current }
      end_time { Time.current }
    end
  end
end
