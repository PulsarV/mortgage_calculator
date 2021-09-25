# frozen_string_literal: true

class LoanTermValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.bank&.loan_term.present? && value.present?

    unless record.bank.loan_term == value
      record.errors.add attribute,
                        (options[:message] || "must be equal to #{record.bank.loan_term}")
    end
  end
end
