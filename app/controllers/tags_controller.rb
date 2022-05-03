class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_slug(params[:slug])
    redirect_to controller: :topics, action: :index, 'filterrific[with_tag_id]' => @tag.id
  end
end
