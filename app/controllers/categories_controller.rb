class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @tags = Tag.all.order('updated_at ASC')
  end

  def show
    @category = Category.find(params[:id])
    @posts = Post.where(category_id: @category.id)
    @categories = Category.all
    @tags = Tag.all.order('updated_at ASC')
  end

end