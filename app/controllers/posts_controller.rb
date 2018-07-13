class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @author = Author.find(@post.author_id)
  end

  def new
    @post = Post.new
    @author = Author.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post Created'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @author = Author.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post Updated'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path, notice: 'Post deleted'
    else
      redirect_to posts_path, alert: 'There was an error'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id)
  end

end
