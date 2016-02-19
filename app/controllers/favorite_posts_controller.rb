class FavoritePostsController<ApplicationController
  before_action :set_post
  before_filter :authenticate_user!

  def create
    if Favorite.create(favorited: @post, user: current_user)
      redirect_to post_path(@post)
      flash[:success] = 'Post has been favorited'
    else
      redirect_to root_path
      flash[:danger] = 'Something went wrong.'
    end
  end

  def destroy
    Favorite.where(favorited_id: @post.id, user_id: current_user.id).first.destroy
    redirect_to post_path(@post)
    flash[:success] = 'Post is no longer in favorites'
  end

  private

  def set_post
    @post = Post.find(params[:post_id] || params[:id])
  end
end

