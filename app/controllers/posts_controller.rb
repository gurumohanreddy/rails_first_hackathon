class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    flash[:alert]=  "Unable to Post as the field(s) is left empty" unless @post.save
      redirect_to posts_path

    end

  def index
    @posts = Post.all

  end

  private
  def post_params
      params.require(:post).permit(:title,:description,:youtube_link,:image)
  end


end
