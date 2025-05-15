require "vips"

class OpengraphImage
  DEFAULT_LOGO_PATH = Rails.root.join("app", "assets", "images", "company.png")

  def initialize(title:, byline:, logo: Logo.new(DEFAULT_LOGO_PATH))
    @title = title
    @byline = byline
    @logo = logo
  end

  def render_in(view_context)
    svg = view_context.render(template: "opengraph_image/show", formats: [:svg], locals: { title:, byline:, logo: })
    case view_context.request.format.symbol
    when :png then ::Vips::Image.svgload_buffer(svg).write_to_buffer(".png")
    when :svg then svg
    else raise "Unsupported format"
    end
  end

  private

  attr_reader :title, :byline, :logo
end
