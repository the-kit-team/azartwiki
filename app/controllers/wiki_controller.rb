class WikiController < ApplicationController
  before_action :set_wiki, only: %i(show edit update destroy)

  # GET /wiki
  def index
    @wiki = Wiki.all
  end

  # GET /wiki/1
  def show
  end

  # GET /wiki/new
  def new
    @wiki = Wiki.new seo_metadata: SeoMetadata.new
  end

  # GET /wiki/1/edit
  def edit
  end

  # POST /wiki
  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      redirect_to @wiki, notice: 'Wiki was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wiki/1
  def update
    if @wiki.update(wiki_params)
      redirect_to @wiki, notice: 'Wiki was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wiki/1
  def destroy
    @wiki.destroy
    redirect_to wiki_index_url, notice: 'Wiki was successfully destroyed.'
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

  def wiki_params
    params.require(:wiki).permit(:title, :text, :bootsy_image_gallery_id, seo_metadata_attributes: [:keywords, :description])
  end
end
