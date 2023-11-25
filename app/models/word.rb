# frozen_string_literal: true

class Word < ApplicationRecord
  validates :name, presence: true
end
