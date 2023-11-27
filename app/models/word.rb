# frozen_string_literal: true

class Word < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :rounds
end
