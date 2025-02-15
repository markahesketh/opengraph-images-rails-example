class Logo
  attr_reader :image_path

  def initialize(image_path)
    @image_path = image_path
  end

  def to_base64
    image_content = File.read(image_path)
    encoded_image = Base64.strict_encode64(image_content)
    "data:#{content_type};base64,#{encoded_image}"
  end

  private

  def content_type
    case File.extname(image_path).downcase
    when ".png" then "image/png"
    when ".jpg", ".jpeg" then "image/jpeg"
    when ".gif" then "image/gif"
    else "image/png"
    end
  end
end