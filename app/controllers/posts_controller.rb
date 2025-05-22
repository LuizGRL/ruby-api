class PostsController < ApplicationController
    before_action :authorize

    def create
      @post = Post.create(post_params)
      if @post.valid?
        render json: { post: @post }, status: :ok
      else
        render json:  { error: @post }, status: :unprocessable_entity
      end
    end

    def post_params
      params.require(:post).permit(:title)
    end
end
