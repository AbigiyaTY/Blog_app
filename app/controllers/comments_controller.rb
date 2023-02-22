class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @comments = Comment.all
  end

  def new
    render :new, locals: { user: current_user }
  end

  def create
    post_id = params[:post_id].to_i
    post = Post.find(post_id)
    comment = Comment.new(text: params[:user][:text], author: current_user, post:)
    if comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_post_path(current_user, post)
    else
      flash.now[:error] = 'Something went wrong!'
      render :new, locals: { user: current_user }, status: 302
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @post.decrement!(:comments_counter)
    @comment.destroy
    redirect_to user_post_path(user_id: @post.author_id, post_id: @post.id), notice: 'Deleted Comment'
  end
end
