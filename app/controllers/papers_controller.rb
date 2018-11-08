class PapersController < ApplicationController

  # GET /papers
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  def show
    @paper = Paper.find(params[:id])
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers
  def create
    @paper = Paper.new(paper_params)
    if @paper.save
      redirect_to @paper
    else
      render :new
    end
  end

  # PATCH/PUT /papers/1
  def update
    @paper = Paper.find(params[:id])

    if @paper.update(paper_params)
      redirect_to @paper
    else
      render :edit
    end
  end

  # DELETE /papers/1
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    redirect_to papers_path
  end

  private
    # Only allow a trusted parameter "white list" through.
    def paper_params
      params.require(:paper).permit(:title, :venue, :year, :author_id)
    end
end
