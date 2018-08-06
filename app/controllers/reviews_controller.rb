class ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_review, only: [:show, :update, :edit, :destroy]
  before_action :set_company

  def new
    @review = Review.new
    @review.user = current_user
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review
    @review.company = Company.find(params[:company_id])

    if @review.save
      redirect_to company_path(@review.company), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_user
    @user = current_user
  end

  def review_params
    params.require(:review).permit(:user_position, :user_area, :content)
  end

end
