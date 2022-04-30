require 'rails_helper'

RSpec.describe InvestmentService do
  let(:campaign) do
    Campaign.create(id: 1, name: "Carter-Glover", image: "http://osinski.org/zina.satterfield", target_amount: 978952.0,
                    sector: "HealthCare", country: "England", investment_multiple: 3610.00, currency: "GBP")
  end

  let(:params) do
    {
      amount: 36100.00,
      campaign_id: campaign.id
    }
  end

  let(:instance) { described_class.new(params) }

  let(:investment) do
    Investment.create(amount: 36100, campaign: campaign)
  end

  context '#create' do
    it 'creates investment and updates campaign percentage_raised and total_amount_raised attributes' do
      instance.create
      expect(investment.amount).to eq 36100.00
      expect(investment.campaign_id).to eq 1
      expect(campaign.reload.total_amount_raised).to eq 36100.00
      expect(campaign.reload.percentage_raised).to eq 3
    end
  end
end
