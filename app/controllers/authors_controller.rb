class AuthorsController < ApplicationController
  def new
  end

  def index
  end

  def create
    @author = Author.new(params.require(:author).permit(:title, :text))

    @author.save
    redirect_to @author
  end

  def show
    @author = Author.find(params[:id])
  end
end
