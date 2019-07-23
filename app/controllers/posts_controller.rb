class PostsController < ApplicationController
  before_action :check_time, only: [:edit, :update]

  def index
    @posts = Post.all.order('created_at DESC')
  end
​
  def show
    @post = Post.find(params[:id])
    redirect_to posts_path
  end
​
  def new
    @post = Post.new
  end
​
  def edit
    check_time
    @post = Post.find(params[:id])
  end
​
  def create
    @post = Post.create(post_params)
​
    if @post.save
      redirect_to posts_path(post_params[:recipient_id])
    else
      render 'new'
    end
  end
​
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path(post_params[:recipient_id])
  end
​
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
​
    redirect_to posts_path
  end
  
  private
​
  def post_params
    params.require(:post).permit(:message, :recipient_id)
  end
​
  def can_edit
    @post = Post.find(params[:id])
    unless @post && current_user && current_user.can_edit?
      redirect_to posts_path, notice: "Post can only be deleted or edited by its author!"
    end
  end
​
  def check_time
    if Time.now > @post = Post.find(params[:id])[:created_at] + 10.minutes
      redirect_to posts_path, notice: "Post can only be edited 10 min after it has been created"
    end
  end
​
end