class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :path, :image, :announce, :text, :published_at

  def path
    Rails.application.routes.url_helpers.topic_path(object, url_path: object.url_path)
  end
end
