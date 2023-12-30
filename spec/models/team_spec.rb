# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#total_points' do
    it 'returns the total of points from all rounds' do
      team = create(:team)
      round = create(:round, team:)
      create(:step, round:)

      expect(team.total_points).to eq(1)
    end
  end

  describe '#first_round_points' do
    it 'returns the total of points from first_round' do
      team = create(:team)
      first_round = create(:round, kind: :first_round, team:)
      create(:step, round_kind: first_round.kind, round: first_round)
      second_round = create(:round, kind: :second_round, team:)
      create(:step, round_kind: second_round.kind, round: second_round)
      third_round = create(:round, kind: :third_round, team:)
      create(:step, round_kind: third_round.kind, round: third_round)

      expect(team.first_round_points).to eq(1)
    end
  end

  describe '#second_round_points' do
    it 'returns the total of points from second_round' do
      team = create(:team)
      first_round = create(:round, kind: :first_round, team:)
      create(:step, round_kind: first_round.kind, round: first_round)
      second_round = create(:round, kind: :second_round, team:)
      create(:step, round_kind: second_round.kind, round: second_round)
      third_round = create(:round, kind: :third_round, team:)
      create(:step, round_kind: third_round.kind, round: third_round)

      expect(team.second_round_points).to eq(1)
    end
  end

  describe '#third_round_points' do
    it 'returns the total of points from third_round' do
      team = create(:team)
      first_round = create(:round, kind: :first_round, team:)
      create(:step, round_kind: first_round.kind, round: first_round)
      second_round = create(:round, kind: :second_round, team:)
      create(:step, round_kind: second_round.kind, round: second_round)
      third_round = create(:round, kind: :third_round, team:)
      create(:step, round_kind: third_round.kind, round: third_round)

      expect(team.third_round_points).to eq(1)
    end
  end
end
