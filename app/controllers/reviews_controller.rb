class ReviewsController < ApplicationController
  before_action :set_user
  before_action :set_review, only: [:show, :update, :edit, :destroy]
  before_action :set_company

  def new
    @review = Review.new
    @review.build_answer
    @review.user = current_user
    authorize @review
    unless not_yet_reviewed?
      redirect_to company_path(Company.find(params[:company_id])), notice: 'You have already reviewed this company'
    end
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review
    @review.company = Company.find(params[:company_id])
    if @review.save
      update_associated_company_score
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

  def update_associated_company_score
    binding.pry
    @review.company.answer_1_total_score += @review.answer.answer_1
    @review.company.answer_2_total_score += @review.answer.answer_2
    @review.company.answer_3_total_score += @review.answer.answer_3
    @review.company.answer_4_total_score += @review.answer.answer_4
    @review.company.answer_5_total_score += @review.answer.answer_5
    @review.company.save
    calculate_averages
  end

  def calculate_averages
    @review.company.answer_1_average_score += @review.company.answer_1_total_score / @review.company.reviews.length
    @review.company.answer_2_average_score += @review.company.answer_2_total_score / @review.company.reviews.length
    @review.company.answer_3_average_score += @review.company.answer_3_total_score / @review.company.reviews.length
    @review.company.answer_4_average_score += @review.company.answer_4_total_score / @review.company.reviews.length
    @review.company.answer_5_average_score += @review.company.answer_5_total_score / @review.company.reviews.length
    @review.company.save
  end

  def review_params
    params.require(:review).permit(:user_position, :user_area, :content, answer_attributes: [:answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :minority])
  end

  def not_yet_reviewed?
     @company = Company.find(params[:company_id])
     @company.reviews.where(user_id: @user).empty?
  end

end
