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
    elsif vote_changed?
      update
    else
      remove_vote
    end
  end

  def update
    @vote = @review.votes.where(user_id: @user).first
    @vote.update(vote_params)
    2.times {apply_score}
    attempt_update
  end

  private

  def not_yet_voted?
     @review = Review.find(params[:review_id])
     @review.votes.where(user_id: @user).empty?
  end

  def vote_changed?
    @vote.vote_type != @review.votes.where(user_id: @user).first.vote_type
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def set_user
    @user = current_user
  end

  def remove_vote
    @vote = @review.votes.where(user_id: @user).first
    if @vote.vote_type == 'upvote'
      @review.weighting -= 5
    else
      @review.weighting += 5
    end
    @review.save
    @vote.destroy!
  end

  def vote_params
    params.permit(:vote_type, :company, :review)
  end

  def attempt_save
    if @vote.save
    else
      render :new
    end
  end

  def attempt_update
    @vote.save
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
