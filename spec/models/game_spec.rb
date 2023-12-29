# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#ready_to_start?' do
    context 'with no team created' do
      it 'returns false' do
        game = create(:game)
        create_list(:word, 10, game:)

        expect(game.ready_to_start?).to eq(false)
      end
    end

    context 'with no word created' do
      it 'returns false' do
        game = create(:game)
        create_list(:team, 10, game:)

        expect(game.ready_to_start?).to eq(false)
      end
    end

    context 'with words and teams created' do
      it 'returns true' do
        game = create(:game)
        create_list(:team, 10, game:)
        create_list(:word, 10, game:)

        expect(game.ready_to_start?).to eq(true)
      end
    end
  end

  describe '#generate_uuid' do
    it 'generates uuid for game before save' do
      game = build(:game)

      game.save!

      expect(game.uuid).to_not be_nil
    end
  end

  describe '#setup!' do
    context 'when minimum words were created' do
      context 'with minimum teams created' do
        it 'setups the game' do
          game = create(:game, name: 'My newest game!')
          create_list(:word, 40, game:)
          create_list(:team, 5, game:)

          expect(game.words).to receive(:order).exactly(3).with('RANDOM()').and_call_original

          game.setup!

          total_number_of_rounds = Round.kinds.count
          expect(Step.count).to eq(Word.count * total_number_of_rounds)
          expect(Step.first.game).to eq(game)
          expect(Step.first.round_kind).to eq('first_round')
          expect(Step.first.round).to be_nil
        end
      end
    end

    context 'when the game is not ready to start' do
      it 'raises an error' do
        game = create(:game)

        expect do
          game.setup!
        end.to raise_error(NoMinimumGameSettingsError)
      end
    end
  end

  describe '#next_round' do
    context 'when there is no round in progress' do
      it 'creates a new round with the next team' do
        game = create(:game)
        team = create(:team, game:)
        second_team = create(:team, game:)
        round = create(:round, :ended, team:, kind: :first_round)
        create(:step, round_kind: :first_round, game:, round:)
        create(:step, round_kind: :first_round, game:, round: nil)

        next_round = game.next_round
        last_round = Round.last
        expect(next_round).to eq(last_round)
        expect(last_round.id).to_not eq(round.id)
        expect(last_round.kind).to eq('first_round')
        expect(last_round.team).to eq(second_team)
      end
    end

    context 'when there is a round in progress' do
      it 'returns the round that already started' do
        game = create(:game)
        team = create(:team, game:)
        # second team
        create(:team, game:)
        round = create(:round, :started, team:, kind: :first_round)
        create(:step, round_kind: :first_round, game:, round:)
        create(:step, round_kind: :first_round, game:, round: nil)

        next_round = game.next_round

        expect(next_round).to eq(round)
      end
    end

    context 'when there is no team' do
      it 'returns nil' do
        game = create(:game)

        expect(game.next_round).to be_nil
      end
    end
  end

  describe '#next_step' do
    context 'when there steps with no rounds' do
      it 'returns the first step ordered' do
        game = create(:game)

        create(:step, :completed, game:)
        next_step = create(:step, game:)
        create(:step, game:)
        create(:step, :completed, game:)

        expect(game.next_step).to eq(next_step)
      end
    end
  end

  describe '#current_round_kind' do
    it 'returns the next round kind' do
      game = create(:game)
      create(:team, game:)
      create(:step, :completed, game:)
      last_step = create(:step, game:)

      expect(game.current_round_kind).to eq(last_step.round_kind)
    end
  end

  describe '#words_remaining_for' do
    it 'returns the remaining words for the given round kind' do
      game = create(:game)
      create_list(:step, 7, :completed, round_kind: :first_round, game:)
      create_list(:step, 3, round_kind: :first_round, game:)
      create_list(:step, 10, round_kind: :second_round, game:)
      create_list(:step, 10, round_kind: :third_round, game:)

      expect(game.words_remaining_for(:first_round)).to eq(3)
      expect(game.words_remaining_for(:second_round)).to eq(10)
      expect(game.words_remaining_for(:third_round)).to eq(10)
    end
  end

  describe '#started_yet?' do
    context 'when steps is equal to the total of round kinds mutiplied by the number of words' do
      it 'returns true' do
        game = create(:game)
        create_list(:team, 3, game:)
        create_list(:word, 15, game:)
        game.setup!

        expect(game.started_yet?).to eq(true)
      end
    end

    context 'when steps is different from the round kinds mutiplied by the number of words' do
      it 'returns false' do
        game = create(:game)

        expect(game.started_yet?).to eq(false)
      end
    end
  end

  describe '#ended?' do
    context 'when no steps exists' do
      it 'returns false' do
        game = create(:game)

        expect(game.ended?).to eq(false)
      end
    end

    context 'when there is steps' do
      context 'with all status completed' do
        it 'returns true' do
          game = create(:game)
          create(:step, :completed, game:)
          create(:step, :completed, game:)

          expect(game.ended?).to eq(true)
        end
      end

      context 'with some status completed' do
        it 'returns false' do
          game = create(:game)
          create(:step, :completed, game:)
          create(:step, game:)

          expect(game.ended?).to eq(false)
        end
      end
    end
  end
end
