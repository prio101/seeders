class InvestmentSerializer
  include JSONAPI::Serializer
  attributes :name, :contact_email, :amount
  belongs_to :campaign

  attribute :amount do |object|
    object.amount_invested_in_GBP
  end
end
