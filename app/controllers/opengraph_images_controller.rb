class OpengraphImagesController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    render @post.opengraph_image
    expires_in 3.hours, public: true
  end
end
