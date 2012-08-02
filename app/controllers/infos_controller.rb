class InfosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @infos = Info.all
  end

  def show
    @info = Info.find(params[:id])
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(params[:info])

    respond_to do |format|
      if @info.save
        flash[:notice] = 'Info telah disimpan'
        format.html { redirect_to infos_path }
      else
#        flash[:error] = 'Kategori Barang tidak dapat dihapus'
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])

    respond_to do |format|
      if @info.update_attributes(params[:info])
        format.html { redirect_to infos_path, notice: 'Info telah diubah.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @info = Info.find(params[:id])

    if @info.destroy
      flash[:notice] = 'Info telah berhasil dihapus'
    else
      flash[:error] = 'Info tidak dapat dihapus'
    end

    respond_to do |format|
      format.html { redirect_to infos_path}
    end
  end
end
