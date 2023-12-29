# frozen_string_literal: true

class NoMinimumGameSettingsError < StandardError; end

class Game < ApplicationRecord
  has_many :words
  has_many :teams
  has_many :rounds, through: :teams
  has_many :steps, through: :words

  before_save :generate_uuid

  def ready_to_start?
    return false if teams.count.zero?
    return false if words.count.zero?

    true
  end

  def setup!
    raise NoMinimumGameSettingsError unless ready_to_start?

    Round.kinds.each do |kind, _key|
      words.order('RANDOM()').each { |word| word.steps.create!(word:, round_kind: kind) }
    end
  end

  def next_round
    return unless ready_to_start?

    rounds.where(kind: current_round_kind).in_progress.first ||
      next_team.rounds.create!(kind: current_round_kind)
  end

  def next_step
    steps.in_progress.order(:id).first
  end

  def current_round_kind
    next_step&.round_kind
  end

  def words_remaining_for(round_kind)
    steps.group(:round_kind).where(round: nil).count[round_kind.to_s]
  end

  def started_yet?
    return false if steps.count.zero?

    steps.count == (words.count * Round.kinds.count)
  end

  def ended?
    return false if steps.count.zero?

    steps.in_progress.none?
  end

  private

  def next_team
    key = (rounds.count % teams.count)

    teams.order(:id)[key]
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
