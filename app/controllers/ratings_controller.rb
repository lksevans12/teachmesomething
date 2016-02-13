class RatingsController < ApplicationController

  def new
    params[:user_id] ? @ratingable = User.find(params[:user_id]) : @ratingable = Listing.find(params[:listing_id])
    @rating = Rating.new
  end

  def create
    if params[:user_id]
      @user = User.find(params[:user_id])
      @rating = @user.ratings.build(rating_params)
    else
      @listing = Listing.find(params[:listing_id])
      @rating = @listing.ratings.build(rating_params)
    end
    if @rating.save
      flash[:notice] = "Your rating has been saved!"
      if @user
        redirect_to user_path(@user)
      else
        redirect_to listing_path(@listing)
      end
    else
      render :"ratings/new"
    end
  end

  def destroy
    params[:user_id] ? @ratingable = User.find(params[:user_id]) : @ratingable = Listing.find(params[:listing_id])
    @rating = Rating.find_by(id: params[:id])
    @rating.destroy
    redirect_to user_path(@ratingable)
    flash[:notice] = "Your rating has been deleted"
  end

  private

  def rating_params
    params.require(:rating).permit(:rating_body,:rating_score).merge(user_id: current_user.id)

  end

end

end