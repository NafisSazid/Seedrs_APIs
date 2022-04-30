class InvestmentService < ApplicationController
  def self.create(params)
    campaign = Campaign.find(params[:campaign_id])
    amount = params[:amount]
    if(amount % campaign.investment_multiple == 0)
      investment = Investment.create(amount: amount, campaign: campaign)
      total_amount_raised = campaign.total_amount_raised + amount
      percentage_raised = total_amount_raised / campaign.target_amount * 100
      campaign.update(percentage_raised: percentage_raised, total_amount_raised: total_amount_raised)
      return investment
    else
      raise Errors::InvalidInvestment
    end
  end
end
