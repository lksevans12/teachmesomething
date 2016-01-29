class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    post = Post.new(post_params.merge(user_id: current_user.id))
    if post.save
      redirect_to root_path
    else
      "error"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id,)
  end

end