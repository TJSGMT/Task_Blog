class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    if current_user
      posts = current_user.posts
      render json: posts, each_serializers: PostSerializer
    else
      render json: {error: "unauthorized"}, status: :unauthorized
    end  
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
      if @post_update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  Private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def authenticate_user
     unless current_user
       render json: {error: "Unauthorized"}, status: :unauthorized
     end
  end
end