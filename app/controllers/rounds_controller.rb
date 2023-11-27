# frozen_string_literal: true

class RoundsController < ApplicationController
  def new
    if any_config_is_missing?
      redirect_to root_path, notice: config_alert
    elsif game_ended?
      redirect_to scoreboard_path, notice: 'Jogo finalizado'
    else
      @round = initialize_round
      @words_available = @round.words_available
    end
  end

  def create
    @round = Round.find_or_create_by!(round_params)
    next_word = @round.next_word

    # when no words is found for this team
    if next_word.blank?
      update_round(@round)
      redirect_to new_round_path
    else
      redirect_to round_path(@round, word_id: next_word)
    end
  end

  def show
    @round = Round.find(params[:id])
    @words_available = @round.words_available
    @word = Word.find(params[:word_id])
  end

  def update
    @round = Round.find(params[:id])
    update_round(@round) if @round.time_remaining?

    next_word = next_word_for_update

    if next_word.present? && @round.time_remaining?
      redirect_to round_path(@round, word_id: next_word)
    else
      redirect_to scoreboard_path
    end
  end

  private

  def next_word_for_update
    if params[:commit_back]
      params[:round][:remove_word_id]
    else
      @round.next_word
    end
  end

  def initialize_round
    # in case exists a team that still have time
    last_round = Round.last
    return last_round if last_round&.time_remaining? && not_all_words_guessed_for?(last_round.kind)

    Round.new(kind: round_kind, team: next_team)
  end

  def not_all_words_guessed_for?(kind)
    Round.where(kind:).map(&:words).flatten.count < Word.count
  end

  def round_kind
    kind_type = (Round.count / Team.count).floor

    Round.kinds.invert[kind_type]
  end

  def next_team
    Team.where.not(id: Round.where(kind: round_kind).pluck(:team_id)).first
  end

  def round_params
    params.require(:round).permit(:team_id, :kind)
  end

  def update_round(round)
    round.words << Word.find(params[:round][:word_id]) if params[:commit_next]
    round.words.delete(Word.find(params[:round][:remove_word_id])) if params[:commit_back]

    round.update(points: round.words.count)
  end
end
