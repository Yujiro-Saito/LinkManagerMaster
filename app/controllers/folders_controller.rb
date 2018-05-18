class FoldersController < ApplicationController

  before_action :set_folder, only: [:show, :edit, :update, :destroy, :authenticate_user!]

  def index
    #@folders = Folder.all.includes(:links)
    if user_signed_in?
      @folders = current_user.folders.includes(:links)
    else

    end
  end

  def show
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

  def folder_params
    params.require(:folder).permit(:title)
  end

  def set_folder
    @folder = Folder.find(params[:id])
  end






end
