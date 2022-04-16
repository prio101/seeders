class InvestmentsController < ApplicationController
  def index
    investments = Investment.all
    render json: InvestmentSerializer.new(investments).serializable_hash.to_json, 
      status: :ok
  end

  def create
  end
end
