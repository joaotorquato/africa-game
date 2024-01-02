# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /scoreboard' do
    it 'renders the scoreboard of the teams' do
      game = create(:game, :setup_completed)
      first_round = create(:round, :ended, team: game.teams.first)
      create(:step, round: first_round)
      other_round = create(:round, :ended, team: game.teams.first)
      create(:step, round: other_round)
      another_round = create(:round, :ended, team: game.teams.third)
      create(:step, round: another_round)

      get scoreboard_path

      expect(assigns(:teams)).to eq([game.teams.first, game.teams.third, game.teams.second])
      expect(assigns(:round)).to eq(game.rounds.completed.last)
      expect(response).to have_http_status(:success)
    end
  end
end
