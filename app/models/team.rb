# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true

  has_many :rounds
  has_many :steps, through: :rounds
  belongs_to :game

  def total_points
    steps.completed.count
  end

  def first_round_points
    steps.completed.where(round_kind: :first_round).count
  end

  def second_round_points
    steps.completed.where(round_kind: :second_round).count
  end

  def third_round_points
    steps.completed.where(round_kind: :third_round).count
  end
end
