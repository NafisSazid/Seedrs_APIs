require 'rails_helper'

RSpec.describe Investment, type: :model do
  let(:campaign) do
    Campaign.new(name: "Carter-Glover", image: "http://osinski.org/zina.satterfield", target_amount: 978952.0,
                        percentage_raised: 7, sector: "HealthCare", country: "England", investment_multiple: 3610.00, currency: "GBP")
  end
  let(:investment) do
    described_class.new(amount: 36100, campaign: campaign)
  end
  context "match attribute names" do
    it "matches with the attribute names" do
      expect(investment.attribute_names).to eq ["id", "amount", "campaign_id", "created_at", "updated_at"]
    end
  end
  it { is_expected.to belong_to(:campaign) }
end

