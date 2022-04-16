require 'rails_helper'

RSpec.describe InvestmentsController, type: :request do
  let!(:campaign) { FactoryBot.create(:campaign) }
  let(:name) { Faker::Name.name }
  let(:contact_email) { Faker::Internet.email }
  let(:amount) { 40 }

  describe 'POST /investments' do
    context 'when request is valid' do
      before do
        post '/api/investments',
             params: { data: { attributes: { name: name, contact_email: contact_email, amount: amount,
                                             campaign_id: campaign.id } } }
      end

      it 'should create a investment' do
        json = JSON.parse(response.body)
        expect(json['data']['attributes']['name']).to eq name
      end

      it 'should return 201 status' do
        expect(response.status).to eq 201
      end
    end

    context 'when request is invalid' do
      before do
        post '/api/investments',
             params: { data: { attributes: { name: '', contact_email: '', amount: amount, campaign_id: campaign.id } } }
      end

      it 'should return status unprocessable entity' do
        expect(response.status).to eq 422
      end
    end
  end
end
