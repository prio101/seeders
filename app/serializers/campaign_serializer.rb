class CampaignSerializer
  include JSONAPI::Serializer

  attributes :name, :sector, :country, :image_url

  attribute :target_amount do |object|
    object.target_amount
  end

  attribute :amount_raised do |object|
    object.amount_raised
  end

  attribute :percentage_raised do |object|
    object.percentage_raised
  end

  attribute :investment_multiple do |object|
    object.investment_multiple
  end
end
