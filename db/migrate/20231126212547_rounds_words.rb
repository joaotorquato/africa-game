# frozen_string_literal: true

class RoundsWords < ActiveRecord::Migration[7.1]
  def change
    create_table :rounds_words, id: false do |t|
      t.belongs_to :word
      t.belongs_to :round
    end
  end
end
