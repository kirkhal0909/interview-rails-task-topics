class Tag < ApplicationRecord
  has_and_belongs_to_many :topics

  before_save :slug_by_name

  private

  def slug_by_name
    self.slug = SlugGenerator.call(name)
  end
end
