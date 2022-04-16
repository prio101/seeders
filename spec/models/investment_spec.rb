require 'rails_helper'

RSpec.describe Investment, type: :model do
  let!(:campaign) { FactoryBot.create(:campaign) }
  let(:investment) { FactoryBot.create(:investment, amount: 40, campaign: campaign) }

  describe 'Investment' do
    describe 'association' do
      it 'should belong to a camptain' do
        expect(investment.campaign.id).to eq campaign.id
      end
    end

    describe '#amount_invested_in_GBP' do
      it 'should return amount in pound' do
        expect(investment.amount_invested_in_GBP).to eq 40.0
      end
    end
  end
end
