# frozen_string_literal: true

class AddRoundKindToStep < ActiveRecord::Migration[7.1]
  def change
    add_column :steps, :round_kind, :integer
  end
end
