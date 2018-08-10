class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_company, only: [:show, :update, :edit, :destroy]

  def index
    @companies = policy_scope(Company)
  end

  def show
    @reviews = @company.reviews.order(weighting: :desc)
  end

  private
  def set_company
    @company = Company.find(params[:id])
    authorize @company
  end
end
