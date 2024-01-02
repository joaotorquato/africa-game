# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def scoreboard
    @teams = current_game.teams.sort_by(&:total_points).reverse
    @round = current_game.rounds.completed.order(:id).last
  end

  def reset_game
    Step.all.destroy_all
    Round.all.destroy_all
    Team.all.destroy_all
    Word.all.destroy_all
    Game.all.destroy_all

    flash[:notice] = 'Jogo resetado.'

    head :ok
  end
end
