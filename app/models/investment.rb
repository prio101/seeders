class Investment < ApplicationRecord
  belongs_to :campaign

  validates_presence_of :amount_in_pence, :contact_email, :name
  validates_numericality_of :amount_in_pence

  validates_format_of :contact_email, with: URI::MailTo::EMAIL_REGEXP

  def amount_invested_in_GBP
    self.amount_in_pence / 100.00
  end
end
