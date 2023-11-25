# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def reset_game
    Team.all.destroy_all
    Word.all.destroy_all
    redirect_to root_path, notice: 'Jogo resetado com sucesso.'
  end
end
