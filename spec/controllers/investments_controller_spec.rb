require 'rails_helper'

RSpec.describe InvestmentsController, type: :controller do
    let!(:campaign) do
      Campaign.create(id: 1, name: "Carter-Glover", image: "http://osinski.org/zina.satterfield", target_amount: 978952.0,
                      percentage_raised: 7, sector: "HealthCare", country: "England", investment_multiple: 3610.00, currency: "GBP")
    end

  describe "Make an investment in a Campaign" do
    let(:params) do
      {
        amount: 36100.00,
        campaign_id: campaign.id
      }
    end

    it "returns status successful and returns investment" do
      post :create, params: params
      response_hash = JSON.parse(response.body)
      investment = response_hash['payload']
      expect(response.status).to eq(201)
      expect(response_hash['status']).to eq('successful')
      expect(investment['amount']).to eq(36100.00)
      expect(investment['campaign_id']).to eq(1)
    end
  end

  describe "When investment amount is not matching with investment multiple" do
    let(:params) do
      {
        amount: 36000.00,
        campaign_id: campaign.id
      }
    end

    it "returns status unsuccessfull and error message" do
      post :create, params: params
      response_hash = JSON.parse(response.body)
      investment = response_hash['payload']
      expect(response.status).to eq(422)
      expect(response_hash['status']).to eq('unsuccessful')
      expect(investment).to eq('Investment amount not matching with the investment multiple for the campaign')
    end
  end

    describe "When investment amount is negative" do
      let(:params) do
        {
          amount: -36000.00,
          campaign_id: campaign.id
        }
      end

      it "returns status unsuccessfull and error message" do
        post :create, params: params
        response_hash = JSON.parse(response.body)
        investment = response_hash['payload']
        expect(response.status).to eq(422)
        expect(response_hash['status']).to eq('unsuccessful')
        expect(investment).to eq('Investment amount is invalid')
      end
    end
end
