require "vips"

class OpengraphImage
  include SvgHelper

  TEMPLATE_PATH = Rails.root.join("app", "views", "opengraph", "show.svg.erb")
  DEFAULT_LOGO_PATH = Rails.root.join("app", "assets", "images", "company.png")

  def initialize(title:, byline:, logo: Logo.new(DEFAULT_LOGO_PATH))
    @title = title
    @byline = byline
    @logo = logo
  end

  def to_png
    ::Vips::Image.svgload_buffer(template).write_to_buffer(".png")
  end

  private

  attr_reader :title, :byline, :logo

  def template
    ERB.new(File.read(TEMPLATE_PATH)).result(binding)
  end
end
