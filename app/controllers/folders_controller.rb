class FoldersController < ApplicationController

  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def index
    @folders = Folder.all.includes(:links)
  end

  def show
  end

  def create
    @folder = Folder.new(folder_params)

    @folder.save

    redirect_to @folder
  end

  def new
    @folder = Folder.new
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

  def folder_params
    params.require(:folder).permit(:title)
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end






end
