class TopicsController < ApplicationController
  def index
    sort_column = params[:sort_column] if params[:sort_order].in?(%w[id published_at title])
    sort_order = params[:sort_order] if params[:sort_order].in?(%w[asc desc])
    @topics = Topic.order(sort_column || :id => sort_order || :asc)
                   .only_published
                   .page(params[:page])
  end

  def show
    @topic = Topic.find_by(url_path: params[:url_path], slug: params[:slug])
    @tags = @topic.tags
  end
end
