class FoldersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  before_action :set_folder, only: [:show, :edit, :update, :destroy, :authenticate_user!]

  def index
    if user_signed_in?
      @folders = current_user.folders.includes(:links)
    else

    end
  end

  def show
    links = @folder.links
    @box = []
    for article in links do
      @title = get_title(article.url)
      @box.push(@title)
    end
  end

  def create
    
    @folder = current_user.folders.build(folder_params)
    if @folder.save
      redirect_to @folder
    else
      render 'new'
    end

  end

  def new
    @folder = current_user.folders.build
  end

  def edit
  end

  def update
    if @folder.update(folder_params)
      redirect_to @folder
    else
      render "edit"
    end
  end

  def destroy
    @folder.destroy
    redirect_to folders_path
  end


  private

  def get_title(url)
    link = url
    charset = nil

    html = open(url) do |f|
      charset = f.charset 
      f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)

    title = p doc.title

    return title
  end

  def folder_params
    params.require(:folder).permit(:title)
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end






end
