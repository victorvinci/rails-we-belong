class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def results
    @results_name = Company.search_by_name(params[:query])
    @results_industry = Company.search_by_industry(params[:query])
    @results_global = Company.global_search(params[:query])
  end
end
