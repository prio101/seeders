require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:valid_campaign) { FactoryBot.create(:campaign) }
  let(:invalid_campaign) { FactoryBot.create(:campaign, amount_raised_in_pence: 50_000_000) }
  let!(:investment) { FactoryBot.create(:investment, campaign_id: valid_campaign.id) }
  let!(:investment_two) { FactoryBot.create(:investment, campaign: valid_campaign) }

  describe 'Campaign' do
    describe 'association' do
      it 'should have many investmensts associated to it' do
        expect(valid_campaign.investments.count).to eq 2
      end
    end

    describe '#target_amount' do
      it 'should generate pound from the pences' do
        expect(valid_campaign.target_amount).to eq valid_campaign.target_amount_in_pence / 100.00
      end
    end

    describe '#amount_raised' do
      it 'should generate pound from the pences' do
        expect(valid_campaign.amount_raised).to eq valid_campaign.amount_raised_in_pence / 100.00
      end
    end

    describe '#percentage_raised' do
      it 'should return percentage if amount raised is less than target amount' do
        expect(valid_campaign.percentage_raised).not_to eq 0
      end

      it 'should return 0 if amount raised is more than target amount' do
        expect(invalid_campaign.percentage_raised).to eq 0
      end
    end

    describe '#investment_multiple' do
      it 'should return investment multiple' do
        expect(valid_campaign.investment_multiple).to eq 4.44
      end
    end

    describe '#default_currency' do
      it 'should return GBP as default currency' do
        expect(valid_campaign.default_currency).to eq 'GBP'
      end
    end
  end
end
