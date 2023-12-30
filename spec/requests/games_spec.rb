# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Games', type: :request do
  describe 'POST /create' do
    it 'redirects to next step page' do
      game = create(:game)
      create_list(:team, 3, game:)
      create_list(:word, 10, game:)

      post games_path

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(step_path(game.next_step))
    end

    context 'when minimum game settings is not achieved' do
      it 'redirects to root_path' do
        post games_path

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
