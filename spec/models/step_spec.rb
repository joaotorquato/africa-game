# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Step, type: :model do
  describe '#complete!' do
    it 'completes the step with the round given' do
      game = create(:game)
      round = create(:round, game:)
      step = create(:step, game:)

      expect(step.complete!(round)).to eq(true)
    end
  end
end
