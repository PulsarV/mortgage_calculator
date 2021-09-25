# frozen_string_literal: true

class Bank < ApplicationRecord
  has_many :calculations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :interest_rate, numericality: { greater_than: 0, less_than: 100 }
  validates :max_loan, numericality: { greater_than: 0 }
  validates :min_down_payment, numericality: { greater_than: 0 }, min_down_payment: true
  validates :loan_term, numericality: { only_integer: true, greater_than: 0 }
end
