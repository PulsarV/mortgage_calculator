# frozen_string_literal: true

class CalculationService
  def self.calculate_monthly_payment(calculation)
    initial_loan = calculation.initial_loan
    down_payment = calculation.down_payment
    loan_term = calculation.loan_term
    interest_rate = calculation.interest_rate
    monthly_rate = interest_rate / 100.0 / 12

    (initial_loan - down_payment) * monthly_rate * (1 + monthly_rate)**loan_term / ((1 + monthly_rate)**loan_term - 1)
  end
end
