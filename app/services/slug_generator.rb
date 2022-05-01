require 'babosa'

class SlugGenerator < ApplicationService
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def call
    @string.to_slug.normalize(transliterations: :russian).to_s
  end
end
