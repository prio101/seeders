class Campaign < ApplicationRecord
  DEFAULT_CURRENCY = 'GBP'

  has_many :investments

  # amount in pound
  def target_amount
    target_amount_in_pence / 100.00
  end

  # raised in pound
  def amount_raised
    amount_raised_in_pence / 100.00
  end

  def percentage_raised
    return amount_raised / 100 if amount_raised <= target_amount

    0
  end

  # formula: ( CD + RV ) / Paid in capital
  # CD = total amount of cash been paid to limited partners / in this case the campaign owner
  # RV = Remaining value or equity
  # paid in capital = Capital given by stackholders / guests
  def investment_multiple
    ((amount_raised + total_equity_left) / amount_raised).round(2)
  end

  def total_equity_left
    target_amount - amount_raised
  end

  def default_currency
    DEFAULT_CURRENCY
  end
end
