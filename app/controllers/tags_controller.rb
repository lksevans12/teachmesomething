class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(title: params[:title])
    @posts = @tag.posts.paginate(:page => params[:page], :per_page => 15)
  end
  
end