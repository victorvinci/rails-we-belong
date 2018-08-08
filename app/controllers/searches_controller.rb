class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @results = Review.search(params[:query])
    if @results.empty?
      @companies = Company.search(params[:query])
    end
  end


end
