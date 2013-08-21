class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:name).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def prices
    @markets = Market.includes(purchase_lines: :product).where("purchase_lines.product_id = ?", params[:id]).references(:purchase_lines).where(['purchase_date > ?', Time.now - 6.months]).order('purchase_date ASC')
    @data_by_market = Hash.new([])

    for market in @markets
      market.purchase_lines.each do |line|
        @data_by_market[market.id] << [line.purchase.purchase_date, line.price]
      end
    end
    
    respond_to do |format|
      format.js
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:name)
  end
end
