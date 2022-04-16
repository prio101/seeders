class CampaignsController < ApplicationController
  include JSONAPI::Pagination

  def index
    campaigns = Campaign.all
   
    jsonapi_paginate(campaigns) do |paginated|
      render jsonapi: paginated, status: :ok
    end
  end

  private

  def jsonapi_page_size(pagination_params)
    per_page = pagination_params[:size].to_f.to_i
    per_page = 10 if per_page > 10 || per_page < 1
    per_page
  end
end
