class CampaignsController < ApplicationController
  def index
    campaigns = Campaign.all
    render json: CampaignSerializer.new(campaigns).serializable_hash.to_json
  end
end
