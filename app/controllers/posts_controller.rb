class PostsController < ApplicationController
  before_action :authenticate_request, only: %i[ create update destroy ]
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer, include_images: false
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post
      render json: @post, serializer: PostSerializer, include_images: true
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  # POST /posts
  def create
    @post = current_user.posts.create!(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.permit(:title, :body, :preview, images: [])
  end
end
