class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_slug(params[:slug])
  end
end
