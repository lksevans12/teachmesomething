class ReviewsController < ApplicationController
  before_filter :authenticate_user!

  def new
    params[:user_id] ? @reviewable = User.find(params[:user_id]) : @reviewable = Post.find(params[:post_id])
    @review = Review.new
  end

  def create
    if params[:user_id]
      @user = User.find(params[:user_id])
      @review = @user.reviews.build(review_params)
    else
      @post =Post.find(params[:post_id])
      @review = @post.reviews.build(review_params)
    end
    if @review.save
      flash[:success] = "Your review has been saved!"
      if @user
        redirect_to user_path(@user)
      else
        flash[:danger] = @review.errors.full_messages
        redirect_to post_path(@post)
      end
    else
      render :"reviews/new"
    end
  end

  def destroy
    params[:user_id] ? @reviewable = User.find(params[:user_id]) : @reviewable = Post.find(params[:post_id])
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to user_path(@reviewable)
    flash[:success] = "Your review has been deleted"
  end

  private

  def review_params
    params.require(:review).permit(:body,:score).merge(user_id: current_user.id)

  end

end