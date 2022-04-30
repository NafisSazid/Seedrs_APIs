require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:subject) do
    described_class.new(name: "Carter-Glover", image: "http://osinski.org/zina.satterfield", target_amount: 978952.0,
                        percentage_raised: 7, sector: "HealthCare", country: "England", investment_multiple: 3610.00, currency: "GBP")
  end
  let(:investment) do
    Investment.new(amount: 36100, campaign: subject)
  end
  describe "match attribute names" do
    it "matches with the attribute names" do
      expect(subject.attribute_names).to eq %w[id name image percentage_raised target_amount sector country investment_multiple total_amount_raised currency created_at updated_at]
    end
  end

  it "has many investments" do
    should respond_to(:investment)
  end
end
