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
      available_filters: [:sorted_by, :with_tag_id],
      sanitize_params: true
    ) || return
    @topics = @filterrific.find.page(params[:page])
  end

  def show
    @topic = Topic.find_by(url_path: params[:url_path], slug: params[:slug])
    @tags = @topic.tags
  end
end
