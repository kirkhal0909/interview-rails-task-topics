class Tag < ApplicationRecord
  has_and_belongs_to_many :topics

  before_save :slug_by_name

  def self.options_for_select
    order('name').map { |tag| [tag.name, tag.id] }
  end

  def to_param
    slug
  end

  private

  def slug_by_name
    self.slug = SlugGenerator.call(name)
  end
end
