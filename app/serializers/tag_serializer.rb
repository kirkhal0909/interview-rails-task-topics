class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :path

  def path
    Rails.application.routes.url_helpers.tag_path(object)
  end
end
