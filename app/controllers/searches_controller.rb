class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @results = Review.search(params[:query]).page params[:page]
    if @results.empty?
      @companies = Company.search(params[:query]).page params[:page]
    end
  end


end
