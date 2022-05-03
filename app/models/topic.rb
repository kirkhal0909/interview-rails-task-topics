class Topic < ApplicationRecord
  mount_uploader :image, TopicImageUploader
  has_and_belongs_to_many :tags

  filterrific(
    default_filter_params: { sorted_by: 'id_asc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_tag_id
    ]
  )
  scope :only_published, -> { where(published: true) }
  scope :search_query, ->(query) { only_published.where('title LIKE ?', "%#{query}%") }
  scope :with_tag_id, ->(tag_id) { Topic.only_published.joins(:tags).where(tags: { id: tag_id }) }
  scope :sorted_by, ->(sort_option) {
    direction = /desc$/.match?(sort_option) ? :desc : :asc
    case sort_option.to_s
    when /^id_/
      only_published.order(id: direction)
    when /^published_at_/
      only_published.order(published_at: direction)
    when /^title_/
      only_published.order(title: direction)
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  paginates_per 20

  validates :title, presence: true
  validates :text, presence: true
  validates_format_of :url_path, with: /[^\/][a-zA-Z\/\-_0-9]+[^\/]\z/,
                                 message: 'некоррктный формат пути. Установленный формат: path/to/topic'

  before_save :generate_slug
  before_save :set_published_at

  def self.options_for_sorted_by
    [
      ['id asc', 'id_asc'],
      ['id desc', 'id_desc'],
      ['published_at asc', 'published_at_asc'],
      ['published_at desc', 'published_at_desc'],
      ['title asc', 'title_asc'],
      ['title desc', 'title_desc']
    ]
  end

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
