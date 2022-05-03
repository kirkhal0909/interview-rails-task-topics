class ApiController < ApplicationController
  def tags
    render json: Tag.all, each_serializer: TagSerializer
  end

  def topics
    render json: Topic.all, each_serializer: TopicSerializer
  end

  def topic
    @topic = Topic.find_by(url_path: params[:url_path], slug: params[:slug])
    @tags = @topic.tags
    respond_to do |format|
      format.html { render 'topics/show' }
    end
  end
end
