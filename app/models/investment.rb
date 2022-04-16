class Investment < ApplicationRecord
  before_validation :convert_amount_to_pence
  belongs_to :campaign

  validates_presence_of :amount, :contact_email, :name
  validates_numericality_of :amount

  validates_format_of :contact_email, with: URI::MailTo::EMAIL_REGEXP

  validate :check_investment_is_appropiate

  def amount_invested_in_GBP
    self.amount / 100.00
  end

  private

  def check_investment_is_appropiate
    minimum_amount_to_invest = self.campaign.investment_multiple
    unless self.amount_invested_in_GBP >=  minimum_amount_to_invest
      self.errors.add(:amount, :invalid, message: "Invested must be 
        equal or greater than #{minimum_amount_to_invest}")
    end
  end

  def convert_amount_to_pence
    self.amount = self.amount * 100
  end
end
