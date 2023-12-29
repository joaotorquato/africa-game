# frozen_string_literal: true

class CreateRound < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.references :team, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :sequence
      t.integer :kind

      t.timestamps
    end
  end
end
