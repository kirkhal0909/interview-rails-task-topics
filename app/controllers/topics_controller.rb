class TopicsController < ApplicationController
  def index
    @topics = Topic.page(params[:page])
  end

  def show
    @topic = Topic.find_by(url_path: params[:url_path], slug: params[:slug])
  end
end
