# frozen_string_literal: true

class StepsController < ApplicationController
  def show
    @step = Step.find(params[:id])
    @round = current_game.next_round
    @words_remaining_for_current_round = current_game.words_remaining_for(@round.kind)
  end

  def edit
    @step = Step.find(params[:id])
    @round = current_game.next_round
    # set the round for step
    @step.round = @round
    # start round if it is not started
    @round.start!
    @words_remaining_for_current_round = current_game.words_remaining_for(@round.kind)
  end

  def update
    @step = Step.find(params[:id])
    @round = Round.find(step_params[:round_id])

    @step.complete!(@round) if @round.time_remaining?
    @round.end! if @round.times_up? || round_kind_ended?

    redirect_to_next_page
  end

  private

  def step_params
    params.require(:step).permit(:round_id)
  end

  def round_kind_ended?
    @step.round_kind != current_game.next_step&.round_kind
  end

  def redirect_to_next_page
    if round_kind_ended?
      redirect_to scoreboard_path
    elsif @round.times_up?
      redirect_to step_path(@step)
    else
      redirect_to edit_step_path(current_game.next_step)
    end
  end
end
