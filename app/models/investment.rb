class Investment < ApplicationRecord
  before_validation :convert_amount_to_pence
  before_save :update_campaign_amount

  belongs_to :campaign

  validates_presence_of :amount, :contact_email, :name
  validates_numericality_of :amount

  validates_format_of :contact_email, with: URI::MailTo::EMAIL_REGEXP

  validate :check_investment_is_appropiate

  def amount_invested_in_GBP
    amount / 100.00
  end

  private

  def check_investment_is_appropiate
    minimum_amount_to_invest = campaign.investment_multiple
    unless amount_invested_in_GBP >= minimum_amount_to_invest
      errors.add(:amount, :invalid, message: "Invested must be
        equal or greater than #{minimum_amount_to_invest}")
    end
  end

  def convert_amount_to_pence
    self.amount = amount * 100
  end

  def update_campaign_amount
    ActiveRecord::Base.transaction do
      updated_amount = campaign.amount_raised_in_pence + amount
      campaign.update!(amount_raised_in_pence: updated_amount)
    end
  rescue StandardError => e
    logger.error "errors: #{e.split(' ').join("\n")}"
  end
end
