class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    rating = Rating.create(rating_params).merge(user_id: current_user.id)
  end

  def destroy
  end

  private

  def rating_params
  params.require(:ratings).permit(:review_body, :review_score)


end