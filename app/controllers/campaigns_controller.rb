class CampaignsController < ApplicationController

  # GET /campaigns
  def index
    @campaigns = Campaign.all

    render json: {status: :successful, payload: @campaigns}
  end

  def filter_campaigns_by_sector
    @campaigns = Campaign.where(sector: filter_by_sector_params[:sector_name])

    render json: {status: :successful, payload: @campaigns}
  end

  def filter_campaigns_by_investment_count
    @campaigns = Campaign.select do |campaign|
      campaign.investment.count == filter_by_investment_count_params[:investment_count].to_i
    end

    render json: {status: :successful, payload: @campaigns}
  end

  private

  def filter_by_sector_params
    params.permit(:sector_name)
  end

  def filter_by_investment_count_params
    params.permit(:investment_count)
  end
end
