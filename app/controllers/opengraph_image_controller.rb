class OpengraphImageController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.png { render plain: @post.opengraph_image.to_png, content_type: "image/png", disposition: "inline" }
    end
    expires_in 3.hours, public: true
  end
end
