class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @response = Response.new
    @responses = @post.responses.includes(:user).order(created_at: :desc)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      @status = true
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      @status = false
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      @status = true
    else
      @status = false
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to @post, notice: 'Post was successfully delated.'
  end

  private
    def set_post
         @post = current_user.posts.find_by(id: params[:id])
         redirect_to(posts_url, alert: "ERROR!!") if @post.blank?
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :content, :user_id)
    end

end
