class LinksController < ApplicationController

  require 'nokogiri'
  require 'open-uri'
  before_action :set_link, only: [:show, :edit, :update, :destroy]


  def index
    @links = Link.all
  end

  def show
  end

  def create
    @link = Link.new(link_params, params[:folder_id])
    if @link.save
      redirect_to @link
    else
      render 'new'
    end
  end

  def new
    @link = Link.new(folder_id: params[:folder_id])

    url = 'https://www.airbnb.jp/'

    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end

    doc = Nokogiri::HTML.parse(html, charset)

    @linkTitle = p doc.title

    @linkImage = p doc.css('//meta[property="og:image"]/@content').to_s


  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render 'edit'
    end
  end

  def destroy
    @link.destroy
    redirect_to folders_path
  end


  private
  
  def link_params
    params.require(:link).permit(:name, :url,:folder_id)
  end

  def set_link
    @link = Link.find(params[:id])
  end





end
