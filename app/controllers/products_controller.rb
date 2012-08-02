class ProductsController < ApplicationController
  #  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /products
  # GET /products.json
  def index
    @products = Product.where("name LIKE ?", "%#{params[:name]}%")
    @products = @products.where("is_package = ?", params[:is_package] == 'true' ? 1 : 0) unless params[:is_package].blank?
    @products = @products.page(params[:page]).per(10).order("created_at DESC")
    
    @product = Product.new(:name => params[:name], :is_package => params[:is_package])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @product_packages = ProductPackage.where(:parent_id => params[:id])
    @product_images = ProductImage.where(:product_id => params[:id])
    @product_image = @product.product_images.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @product_categories = ProductCategory.arrange
    render layout: false
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product_categories = ProductCategory.arrange
    #    render layout: false
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        unless params[:image].blank?
          @product_image = ProductImage.new(:image => params[:image], :product_id => @product.id)
          @product_image.save
        end
        format.html { redirect_to @product, notice: "Product was successfully created. #{link_add_product}".html_safe }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.triggered_update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.triggered_destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end

  def order
    @ordered_product = OrderedProduct.new(:user_id => current_user.id,
      :product_id => params[:id],
      :qty => 1)
  end

  #  def save_order
  #    @product = Product.find(params[:id])
  #    @ordered_product = OrderedProduct.where(:user_id => current_user.id, :product_id => params[:id])
  #
  #    unless @ordered_product.blank?
  #      @ordered_product.update_attribute(:qty => @ordered_product.qty + 1,
  #                                        :sub_total => @product.rent_price * (@ordered_product.qty + 1))
  #    else
  #      @ordered_product = OrderedProduct.new(:user_id => current_user.id,
  #                                            :product_id => params[:id],
  #                                            :qty => 1,
  #                                            :sub_total => @product.rent_price)
  #    end
  #    @ordered_product.save
  #
  #    respond_to do |format|
  #      format.html { redirect_to admin_products_url }
  #      format.js
  #    end
  #  end
  private
  def link_add_product
    "<div class='btn'>#{view_context.link_to('Tambah Barang', new_product_path, :rel => 'facebox')}</div>"
  end
end
