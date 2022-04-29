class InvestmentsController < ApplicationController

  # POST /investment
  def create
    @investment = InvestmentService.create(investment_params)

    if @investment.save
      render json: @investment, status: :created
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def investment_params
    params.require(:investment).permit(:amount).merge(params.permit(:campaign_id))
  end
end

