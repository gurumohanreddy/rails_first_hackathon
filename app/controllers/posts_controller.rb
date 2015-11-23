class PostsController < ApplicationController

  before_action :fetch_post , only: [:edit,:update,:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    flash[:alert]=  "Unable to Post as the field(s) is left empty" unless @post.save
    flash[:alert]= "Your post will be available to public after 24 hrs" if @post.save
    redirect_to posts_path

  end

  def index
    @posts = Post.where(published: !(params[:moderate].present? && current_user.admin?))
  end


  def edit

  end


  def update
    if params[:published].present? && current_user.admin?
      @post.published = true
      @post.save
      redirect_to posts_path
    else
      @post.update_attributes(post_params)
      redirect_to @post
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:description,:youtube_link,:image)
  end

  def fetch_post
    if current_user.try(:admin?)
        @post = Post.find(params[:id])
    else

    @post = current_user.posts.find(params[:id])
    end

  end

end
