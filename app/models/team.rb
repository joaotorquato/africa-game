# frozen_string_literal: true

class Team < ApplicationRecord
  validates :name, presence: true
  has_many :rounds
end
