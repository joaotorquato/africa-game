# frozen_string_literal: true

class Step < ApplicationRecord
  belongs_to :word
  has_one :game, through: :word
  belongs_to :round, optional: true

  enum round_kind: { first_round: 0, second_round: 1, third_round: 2 }

  scope :completed, -> { where.not(round: nil) }
  scope :in_progress, -> { where(round: nil) }

  def complete!(round)
    update(round:)
  end
end
