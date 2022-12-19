class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @user = User.find_by(id: params[:user_id])
    @posts = @user.posts
    @posts = Post.all
    @comments = @user.comments
  end

  def show; end

  def new; end

  def edit; end

  def create
    title = params[:user][:title]
    text = params[:user][:text]
    @post = Post.new(title:, text:, comments_counter: 0, likes_counter: 0, author: current_user)
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:author_id, :title, :text, comments_counter: 0, likes_counter: 0)
  end
end
