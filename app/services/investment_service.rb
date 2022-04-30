class InvestmentService < ApplicationController
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def create
    campaign = Campaign.find(params[:campaign_id])
    amount = params[:amount].to_d
    if(amount % campaign.investment_multiple == 0)
      investment = Investment.create(amount: amount, campaign: campaign)
      total_amount_raised = campaign.total_amount_raised + amount
      percentage_raised = total_amount_raised / campaign.target_amount * 100
      campaign.update(percentage_raised: percentage_raised, total_amount_raised: total_amount_raised)
      return investment
    else
      raise Errors::InvalidInvestmentMultiple
    end
  end
end
