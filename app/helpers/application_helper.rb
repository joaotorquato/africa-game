# frozen_string_literal: true

module ApplicationHelper
  def game_can_be_started?
    Team.count >= minimum_teams_required && Word.count >= minimum_words_required_for_this_game
  end

  def any_config_is_missing?
    return true if Team.count.zero? || Word.count.zero?

    Team.count < minimum_teams_required || Word.count < minimum_words_required
  end

  def minimum_words_required
    32
  end

  def minimum_teams_required
    2
  end

  def minimum_words_required_for_this_game
    Team.count * 16
  end

  def config_alert
    "Você precisa cadastrar no mínimo #{minimum_teams_required} times "\
    "e #{minimum_words_required} palavras"
  end

  def game_ended?
    return false if Team.count.zero? || Word.count.zero?

    Team.count * 3 == Round.count
  end
end
