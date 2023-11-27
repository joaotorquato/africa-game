# frozen_string_literal: true

class CreateRounds < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :points
      t.integer :kind

      t.timestamps
    end
  end
end
