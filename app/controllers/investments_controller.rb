class InvestmentsController < ApplicationController

  # POST /investment
  def create
    raise Errors::InvalidInvestment unless investment_params[:amount]&.to_d&.positive?

    @investment = InvestmentService.new(investment_params).create

    if @investment.save
      render json: {status: :successful, payload: @investment}, status: :created
    end
  rescue => errors
    render json: {status: :unsuccessful, payload: errors}, status: :unprocessable_entity
  end

  private

  def investment_params
    params.permit(:amount, :campaign_id)
  end
end

