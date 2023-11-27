# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def scoreboard
    @teams = Team.all
    @round = Round.last
  end

  def reset_game
    Round.all.destroy_all
    Team.all.destroy_all
    Word.all.destroy_all

    flash[:notice] = 'Jogo resetado.'

    head :ok
  end
end
