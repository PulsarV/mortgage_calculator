# frozen_string_literal: true

class InitialLoanValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.bank&.max_loan.present? && value.present?

    unless record.bank.max_loan >= value
      record.errors.add attribute, (options[:message] || "can't be greater than #{record.bank.max_loan}")
    end
  end
end
