class VotesController < ApplicationController
  before_action :set_review
  before_action :set_user

  def create
      @vote = Vote.new(vote_params)
      @vote.user = @user
      authorize @vote
    if not_yet_voted?
      @vote.review = @review
      apply_score
      attempt_save
    else
      redirect_to company_path(@review.company), notice: 'You have already voted for this review'
    end
  end

  private

  def not_yet_voted?
     @review = Review.find(params[:review_id])
     binding.pry
     @review.votes.where(user_id: @user).empty?
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_user
    @user = current_user
  end

  def vote_params
    params.permit(:vote_type, :company, :review)
  end

  def attempt_save
    if @vote.save
      redirect_to company_path(@vote.review.company), notice: 'Vote was successfully created'
    else
      render :new
    end
  end

  def apply_score
    @review = @vote.review
    if @vote.vote_type == 'upvote'
      @review.weighting += 5
      @review.save
    else
      @review.weighting -= 5
      @review.save
    end
  end

end
