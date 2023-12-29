# frozen_string_literal: true

class DropSequenceFromRoundAndStep < ActiveRecord::Migration[7.1]
  def change
    remove_column :steps, :sequence
    remove_column :rounds, :sequence
  end
end
