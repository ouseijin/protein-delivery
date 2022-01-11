class LikesController < ApplicationController
  before_action :require_login

  def create
    if params[:menu_id].present?
      menu = Menu.find(params[:menu_id])
      current_user.like(menu)
    else
      review = Review.find(params[:review_id])
      current_user.like_review(review)
    end
    redirect_back fallback_location: root_path, success: 'いいねしました'
  end

  def destroy
    if params[:menu_id].present?
      menu = current_user.likes.find(params[:id]).menu
      current_user.unlike(menu)
    else
      review = current_user.likes.find(params[:id]).review
      current_user.unlike_review(review)
    end
    redirect_back fallback_location: root_path, success: 'いいねを取り消しました'
  end
end
