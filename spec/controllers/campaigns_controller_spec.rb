require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  before do
    Campaign.create(name: "Carter-Glover", image: "http://osinski.org/zina.satterfield", target_amount: 978952.0,
                 percentage_raised: 7, sector: "HealthCare", country: "England", investment_multiple: 3610.00, currency: "GBP")
  end

  describe "Retrieve all Campaigns" do
    it "returns http success and all campaigns" do
      get :index
      response_hash = JSON.parse(response.body)
      campaign = response_hash['payload'].first
      expect(response).to have_http_status(:success)
      expect(response_hash['status']).to eq('successful')
      expect(campaign['name']).to eq('Carter-Glover')
      expect(campaign['image']).to eq('http://osinski.org/zina.satterfield')
      expect(campaign['target_amount']).to eq(978952.0)
      expect(campaign['percentage_raised']).to eq(7)
      expect(campaign['sector']).to eq('HealthCare')
      expect(campaign['country']).to eq('England')
      expect(campaign['investment_multiple']).to eq(3610.00)
      expect(campaign['currency']).to eq('GBP')
    end
  end

  describe "Retrieve Campaigns by Sector" do
    let(:params) { { sector_name: "HealthCare" } }
    it "returns http success and all campaigns of corresponsing sector" do
      get :filter_campaigns_by_sector, params: params
      response_hash = JSON.parse(response.body)
      campaign = response_hash['payload'].first
      expect(response).to have_http_status(:success)
      expect(response_hash['status']).to eq('successful')
      expect(campaign['name']).to eq('Carter-Glover')
      expect(campaign['image']).to eq('http://osinski.org/zina.satterfield')
      expect(campaign['target_amount']).to eq(978952.0)
      expect(campaign['percentage_raised']).to eq(7)
      expect(campaign['sector']).to eq('HealthCare')
      expect(campaign['country']).to eq('England')
      expect(campaign['investment_multiple']).to eq(3610.00)
      expect(campaign['currency']).to eq('GBP')
    end
  end
end

