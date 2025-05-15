class OpengraphImageController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.png { render @post.opengraph_image }
    end
    expires_in 3.hours, public: true
  end
end
