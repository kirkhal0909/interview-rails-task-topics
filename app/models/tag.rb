class Tag < ApplicationRecord
  before_save :slug_by_name

  def slug_by_name
    self.slug = SlugGenerator.call(name)
  end
end
