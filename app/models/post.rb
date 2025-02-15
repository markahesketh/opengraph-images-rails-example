class Post < ApplicationRecord
  def opengraph_image
    OpengraphImage.new(title:, byline:)
  end
end
