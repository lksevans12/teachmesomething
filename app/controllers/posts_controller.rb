class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new 
    @post = Post.new
  end

  def create
    post = Post.new(post_params.merge(user: 1))

  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :website, :category_id,)
  end

end