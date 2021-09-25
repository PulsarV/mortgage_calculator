# frozen_string_literal: true

class InterestRateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.bank&.interest_rate.present? && value.present?

    unless record.bank.interest_rate == value
      record.errors.add attribute,
                        (options[:message] || "must be equal to #{record.bank.interest_rate}")
    end
  end
end
