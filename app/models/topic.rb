class Topic < ApplicationRecord
  mount_uploaders :image, TopicImageUploader
  has_and_belongs_to_many :tags

  validates_format_of :url_path, with: /\\[a-zA-Z\\\-_0-9]+[^\\]\z/,
                       message: 'должен начинатся с символа "\"; например: \path\to\topic'

  before_save :generate_slug

  def generate_slug
    self.slug = SlugGenerator.call("#{id} #{title}")
  end
end
