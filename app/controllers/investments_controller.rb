class InvestmentsController < ApplicationController
  include JSONAPI::Pagination

  def index
    investments = Investment.all
    jsonapi_paginate(investments) do |paginated|
      render jsonapi: paginated, status: :ok
    end
  end

  def create
    investment = Investment.new(investments_params)
    if(investment.save!)
      render jsonapi: investment, status: :created
    else
      render json: { error: investment.errors }, 
        status: :unprocessable_entity
    end
  end

  private

  def investments_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :contact_email, :amount, :campaign_id)
  end
end
