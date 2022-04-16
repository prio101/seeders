class InvestmentsController < ApplicationController
  def index
    investments = Investment.all
    render json: InvestmentSerializer.new(investments).serializable_hash.to_json, 
      status: :ok
  end

  def create
    investment = Investment.new(investments_params)
    if(investment.save!)
      render json: InvestmentSerializer.new(investment).serializable_hash.to_json, status: :created
    else
      render json: { error: investment.errors }, status: :unprocessable_entity
    end
  end

  private

  def investments_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :contact_email, :amount, :campaign_id)
  end
end
