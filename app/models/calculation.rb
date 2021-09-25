# frozen_string_literal: true

class Calculation < ApplicationRecord
  belongs_to :bank

  before_save :calculate_monthly_payment

  validates :bank_id, presence: true
  validates :interest_rate, numericality: { greater_than: 0, less_than: 100 }, interest_rate: true
  validates :loan_term, numericality: { greater_than: 0 }, loan_term: true
  validates :initial_loan, numericality: { greater_than: 0 }, initial_loan: true
  validates :down_payment, numericality: { greater_than: 0 }, down_payment: true

  private
    def calculate_monthly_payment
      self.monthly_payment = CalculationService.calculate_monthly_payment(self)
    end
end
