# frozen_string_literal: true

class DownPaymentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.bank&.min_down_payment.present? && record.initial_loan.present? && value.present?

    unless record.bank.min_down_payment < value
      record.errors.add attribute,
                        (options[:message] || "can't be less than #{record.bank.min_down_payment}")
    end

    unless record.initial_loan > value
      record.errors.add attribute,
                        (options[:message] || "can't be greater or equal to #{record.initial_loan}")
    end
  end
end
