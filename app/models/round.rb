# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :team
  validates :kind, :team_id, presence: true
  enum kind: { first_round: 0, second_round: 1, third_round: 2 }

  has_and_belongs_to_many :words

  # Load only the records that were created more than a minute ago
  scope :finished, -> { where('created_at <= ?', 1.minute.ago) }

  def time_remaining
    datetime1 = created_at + 61.seconds
    datetime2 = Time.current

    # Calculate the difference in days
    difference_in_seconds = (datetime1 - datetime2).ceil
    return 0 if difference_in_seconds.negative?

    difference_in_seconds
  end

  def words_available
    words = Round.where(kind:).map(&:words).flatten
    Word.where.not(id: words.pluck(:id))
  end

  def next_word
    words_available.sample
  end

  def time_remaining?
    time_remaining.positive?
  end

  def times_up?
    time_remaining.zero?
  end
end
