# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Steps', type: :request do
  let(:game) { create(:game, :setup_completed) }

  describe 'GET /show' do
    it 'shows the step and the next round' do
      step = game.next_step

      get step_path(step)

      round = game.rounds.last
      expect(assigns(:step)).to eq(step)
      expect(assigns(:round)).to eq(round)
      expect(assigns(:words_remaining_for_current_round)).to eq(game.words.count)
    end
  end

  describe 'GET /edit' do
    it 'renders the steps form with the next round' do
      step = game.next_step

      get edit_step_path(step)

      round = game.rounds.last
      expect(assigns(:step)).to eq(step)
      expect(assigns(:round)).to eq(round)
      expect(assigns(:words_remaining_for_current_round)).to eq(game.words.count)
      expect(round.start_time).to_not be_nil
    end
  end

  describe 'PATCH /update' do
    context 'when rounds time is up' do
      it 'ends the round and redirects to next step' do
        step = game.next_step
        round = game.next_round
        round.update(start_time: 61.seconds.ago)
        round.start!

        patch step_path(step), params: { id: step.id, step: { round_id: round.id } }

        expect(round.reload.end_time).to_not be_nil
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(step_path(game.reload.next_step))
      end
    end

    context 'when round has time remaining' do
      it 'completes the step and redirects to next step' do
        game_step = game.next_step
        round = game.next_round
        round.start!

        patch step_path(game_step), params: { id: game_step.id, step: { round_id: round.id } }

        expect(round.reload.end_time).to be_nil
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(edit_step_path(game.reload.next_step))
      end

      context 'with round kind in the last step' do
        it 'completes the step and redirects to scoreboard' do
          game.steps.order(:id).where(round_kind: :first_round).limit(9).each do |game_step|
            round = game.next_round
            round.start!
            round.end!
            game_step.update(round:)
          end
          game_step = game.reload.next_step
          round = game.next_round
          round.start!

          patch step_path(game_step), params: { id: game_step.id, step: { round_id: round.id } }

          expect(round.reload.end_time).to_not be_nil
          expect(response).to have_http_status(:redirect)
          expect(response).to redirect_to(scoreboard_path)
        end
      end
    end
  end
end
