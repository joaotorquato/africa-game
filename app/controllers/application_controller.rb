# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def current_game
    @current_game ||= Game.find_or_create_by!(name: 'First Game')
  end
  helper_method :current_game
end
