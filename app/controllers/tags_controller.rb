class TagsController < ApplicationController

  def show
    @tags = Tag.find_by(title: params[:title])
  end
  
end