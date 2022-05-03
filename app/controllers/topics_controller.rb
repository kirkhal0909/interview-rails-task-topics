class TopicsController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Topic,
      params[:filterrific],
      select_options: {
        sorted_by: Topic.options_for_sorted_by,
        with_tag_id: Tag.options_for_select,
      },
      persistence_id: 'shared_key',
      default_filter_params: {},
      available_filters: [:search_query, :sorted_by, :with_tag_id],
      sanitize_params: true
    ) || return
    @topics = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @topic = Topic.find_by(url_path: params[:url_path], slug: params[:slug])
    @tags = @topic.tags
  end
end
