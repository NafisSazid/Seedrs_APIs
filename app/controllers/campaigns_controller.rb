class CampaignsController < ApplicationController

  # GET /campaigns
  def index
    @campaigns = Campaign.all

    render json: @campaigns
  end
end
