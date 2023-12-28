# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.references :game, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :round_type
      t.datetime :start_time
      t.datetime :end_time
      t.integer :sequence

      t.timestamps
    end
  end
end
