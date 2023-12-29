# frozen_string_literal: true

class GamesController < ApplicationController
  def create
    current_game.setup!

    redirect_to step_path(current_game.next_step)
  rescue NoMinimumGameSettingsError
    flash[:notice] = 'Configurações mínimas não foram criadas'

    redirect_to root_path
  end
end
