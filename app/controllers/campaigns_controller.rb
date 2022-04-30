class CampaignsController < ApplicationController

  # GET /campaigns
  def index
    @campaigns = Campaign.all

    render json: {status: :successful, payload: @campaigns}
  end

  def filter_campaigns_by_sector
    @campaigns = Campaign.where(sector: params[:sector_name])

    render json: {status: :successful, payload: @campaigns}
  end

  private

  def filter_by_sector_params
    params.permit(:sector_name)
  end
end
