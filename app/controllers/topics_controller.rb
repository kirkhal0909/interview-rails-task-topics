class TopicsController < ApplicationController
  def show
    @topic = Topic.find_by(url_path: "\\#{params[:url_path]}", slug: params[:slug])
  end
end
