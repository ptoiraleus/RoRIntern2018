class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    if Author.exists?(@post.author_id)
      @author = Author.find(@post.author_id)
    else
      @author = Author.new(name: "doesn't exist")
    end

    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.new
    @authors = Author.all
  end

  def new
    @post = Post.new
    @authors = Author.all
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
    @authors = Author.all
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
    @post = Post.find(params[:id])
    @post.destroy
    # if post.destroy
    #   redirect_to posts_path, notice: 'Post deleted'
    # else
    #   redirect_to posts_path, alert: 'There was an error'
    # end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author_id)
  end

end
