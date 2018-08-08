class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @results = Review
      .search(params[:query])
      .with_pg_search_highlight
      .page(params[:page])
    if @results.empty?
      @companies = Company.search(params[:query]).with_pg_search_highlight.page(params[:page])
    end
  end


end

