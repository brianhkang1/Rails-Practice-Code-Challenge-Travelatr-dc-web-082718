class BloggersController < ApplicationController

  before_action(:find_blogger, {only: [:show]})

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.save
      redirect_to blogger_path(@blogger.id)
    else
      render :new
    end
  end

  def show
  end


  private

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

end
