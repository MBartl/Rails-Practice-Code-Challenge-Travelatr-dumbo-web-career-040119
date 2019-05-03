class PostsController < ApplicationController

  def show
    find_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    find_post
  end

  def update
    if params[:post] == nil
      find_post.update(likes: find_post.likes+=1)
      redirect_to @post
    elsif find_post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
