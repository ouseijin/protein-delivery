class ReviewLikesController < ApplicationController
  before_action :require_login

  def create
    @review = Review.find(params[:review_id])
    current_user.review_like(@review)
  end

  def destroy
    @review = current_user.review_likes.find(params[:id]).review
    current_user.review_unlike(@review)
  end
end
