class Topic < ApplicationRecord
  mount_uploader :image, TopicImageUploader
  has_and_belongs_to_many :tags

  paginates_per 10

  validates :title, presence: true
  validates :text, presence: true
  validates_format_of :url_path, with: /[^\/][a-zA-Z\/\-_0-9]+[^\/]\z/,
                                 message: 'некоррктный формат пути. Установленный формат: path/to/topic'

  before_save :generate_slug
  before_save :set_published_at

  def self.next_sequence_id
    connection.select_value('SELECT last_value FROM topics_id_seq') + 1 # for Oracle can use Topic.next_sequence_value
  end

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = SlugGenerator.call("#{id || Topic.next_sequence_id} #{title}")
  end

  def set_published_at
    self.published_at ||= Time.now if published
  end
end
