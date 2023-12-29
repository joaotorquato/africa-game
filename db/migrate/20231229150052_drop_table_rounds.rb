# frozen_string_literal: true

class DropTableRounds < ActiveRecord::Migration[7.1]
  def change
    drop_table :rounds
    drop_table :rounds_words
  end
end
