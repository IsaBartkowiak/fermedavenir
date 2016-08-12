module Slugify
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
