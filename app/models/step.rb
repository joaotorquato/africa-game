# frozen_string_literal: true

class Step < ApplicationRecord
  belongs_to :game
  belongs_to :word
  belongs_to :team, optional: true
end
