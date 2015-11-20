class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.description = params[:post][:description]
    @post.youtube_link = params[:post][:youtube_link]

    @post.save

    redirect_to posts_path
  end

  def index
    @posts = Post.all
    
  end

end
