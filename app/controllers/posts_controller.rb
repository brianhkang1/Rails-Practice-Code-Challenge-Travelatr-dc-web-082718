class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update]


  def show
  end

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end

  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :likes)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
