class TagsController < ApplicationController

  def show
    @tag = Tag.find_by(title: params[:title])
  end
  
end