class OpengraphImageController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    render plain: @post.opengraph_image.to_png, content_type: "image/png", disposition: "inline"
    expires_in 3.hours, public: true
  end
end
