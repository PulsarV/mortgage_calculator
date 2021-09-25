# frozen_string_literal: true

class MinDownPaymentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.max_loan.present? && value.present?

    unless record.max_loan > value
      record.errors.add attribute,
                        (options[:message] || "can't be greater or equal to #{record.max_loan}")
    end
  end
end
