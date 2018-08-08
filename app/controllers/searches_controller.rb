class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @companies = Company
      .search(params[:query])
      .with_pg_search_highlight
      .page(params[:page])
    @results = Review
      .search(params[:query])
      .with_pg_search_highlight
      .page(params[:page])
    if @results.empty?
      @companies
    end
  end


end

