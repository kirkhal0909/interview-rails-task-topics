class Topic < ApplicationRecord
  mount_uploader :image, TopicImageUploader
  has_and_belongs_to_many :tags

  validates_format_of :url_path, with: /\/[a-zA-Z\/\-_0-9]+[^\/]\z/,
                                 message: 'должен начинаться с символа "/"; например: /path/to/topic'

  before_save :generate_slug

  def self.next_sequence_id
    connection.select_value("SELECT last_value FROM topics_id_seq") + 1 # for Oracle can use Topic.next_sequence_value
  end

  private

  def generate_slug
    self.slug = SlugGenerator.call("#{id || Topic.next_sequence_id} #{title}")
  end
end
