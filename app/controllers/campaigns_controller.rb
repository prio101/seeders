class CampaignsController < ApplicationController
  def index
    campaigns = Campaign.all
    render json: CampaignSerializer.new(campaigns), 
      status: :ok
  end
end
