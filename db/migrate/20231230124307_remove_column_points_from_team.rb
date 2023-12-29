# frozen_string_literal: true

class RemoveColumnPointsFromTeam < ActiveRecord::Migration[7.1]
  def change
    remove_column :teams, :points
  end
end
