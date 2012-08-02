class HeaderLinksController < ApplicationController
  # GET /header_links
  # GET /header_links.json
  def index
    @header_links = HeaderLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @header_links }
    end
  end

  # GET /header_links/1
  # GET /header_links/1.json
  def show
    @header_link = HeaderLink.find(params[:id])
    @infos = @header_link.infos

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @header_link }
    end
  end

  # GET /header_links/new
  # GET /header_links/new.json
  def new
    @header_link = HeaderLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @header_link }
    end
  end

  # GET /header_links/1/edit
  def edit
    @header_link = HeaderLink.find(params[:id])
  end

  # POST /header_links
  # POST /header_links.json
  def create
    @header_link = HeaderLink.new(params[:header_link])

    respond_to do |format|
      if @header_link.save
        format.html { redirect_to @header_link, notice: 'Header link was successfully created.' }
        format.json { render json: @header_link, status: :created, location: @header_link }
      else
        format.html { render action: "new" }
        format.json { render json: @header_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /header_links/1
  # PUT /header_links/1.json
  def update
    @header_link = HeaderLink.find(params[:id])

    respond_to do |format|
      if @header_link.update_attributes(params[:header_link])
        format.html { redirect_to @header_link, notice: 'Header link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @header_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /header_links/1
  # DELETE /header_links/1.json
  def destroy
    @header_link = HeaderLink.find(params[:id])
    @header_link.destroy

    respond_to do |format|
      format.html { redirect_to header_links_url }
      format.json { head :no_content }
    end
  end
end
