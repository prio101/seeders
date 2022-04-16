require 'rails_helper'

RSpec.describe CampaignsController, type: :request do
  let!(:campaign) { FactoryBot.create(:campaign) }
  let!(:campaign_2) { FactoryBot.create(:campaign) }

  describe 'GET /api/campaigns' do
    before { get '/api/campaigns' }
    it 'should return campaigns' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(2)
    end

    it 'should return status code 200' do
      expect(response.status).to eq 200
    end
  end
end
