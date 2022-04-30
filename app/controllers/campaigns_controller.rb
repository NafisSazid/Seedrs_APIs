class CampaignsController < ApplicationController

  # GET /campaigns
  def index
    @campaigns = Campaign.all

    render json: {status: :successful, payload: @campaigns}, except: [:total_amount_raised]
  end
end
