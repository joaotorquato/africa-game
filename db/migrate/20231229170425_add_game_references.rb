# frozen_string_literal: true

class AddGameReferences < ActiveRecord::Migration[7.1]
  def change
    add_reference :teams, :game, index: true
    add_reference :words, :game, index: true
    remove_reference :steps, :game
  end
end
