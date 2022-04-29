class InvestmentService < ApplicationController
  def self.create(params)
    campaign = Campaign.find_by_id(params[:campaign_id])
    Investment.create(amount: params[:amount], campaign: campaign)
  end
end
