class PostsController < ApplicationController
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    redirect_to posts_path
  end

  def new
    @post = Post.new(session[:user_id])
  end

  def edit
    @post = Post.find(params[:id], session[:user_id])
  end

  def create
    @post = Post.create(post_params, session[:user_id])

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id], session[:user_id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id], session[:user_id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
