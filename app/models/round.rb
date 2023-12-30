# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :team
  has_one :game, through: :team
  has_many :steps
  validates :kind, :team_id, presence: true
  enum kind: { first_round: 0, second_round: 1, third_round: 2 }

  # Load only the records that were created more than a minute ago
  scope :completed, -> { where.not(end_time: nil) }
  scope :in_progress, -> { where(end_time: nil) }

  ROUND_TIME = 61.seconds

  def start!
    update(start_time: Time.current) if start_time.nil?
  end

  def end!
    update(end_time: Time.current) if end_time.nil?
  end

  def time_remaining
    datetime1 = start_time + ROUND_TIME
    datetime2 = Time.current

    # Calculate the difference in days
    difference_in_seconds = (datetime1 - datetime2).ceil
    return 0 if difference_in_seconds.negative?

    difference_in_seconds
  end

  def time_remaining?
    time_remaining.positive?
  end

  def times_up?
    time_remaining.zero?
  end
end
