# frozen_string_literal: true

class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :name

      t.timestamps
    end
  end
end
