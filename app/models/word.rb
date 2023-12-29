# frozen_string_literal: true

class Word < ApplicationRecord
  validates :name, presence: true

  has_many :steps
  belongs_to :game
end
