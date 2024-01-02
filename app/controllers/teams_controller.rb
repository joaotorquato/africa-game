# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    if current_game.started_yet?
      flash[:notice] = 'Jogo iniciado, não é possível mais cadastrar!'

      redirect_to root_path
    end

    @teams = Team.all
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_path, notice: "O Time #{@team.name} foi criado com sucesso."
    else
      @teams = Team.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name).merge(game: current_game)
  end
end
