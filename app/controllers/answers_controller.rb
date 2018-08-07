class AnswersController < ApplicationController
  before_action :set_user
  before_action :set_answer, only: [:show, :update, :edit, :destroy]
  before_action :set_review

  def new
    @answer = Answer.new
    # @review.user = current_user
    authorize @answer
  end

  def create
    @answer = answer.new(answer_params)
    @answer.user = current_user
    authorize @answer
    @answer.company = Company.find(params[:company_id])

    if @answer.save
      redirect_to company_path(@answer.review.company) # , notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_user
    @user = current_user
  end

  def answer_params
    params.require(:review).permit(:answer_1, :answer_2, :answer_3, :answer_4, :answer_5 )
  end
end
