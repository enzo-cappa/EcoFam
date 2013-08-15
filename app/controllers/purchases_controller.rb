class PurchasesController < ApplicationController
  before_filter :by_period, only: :index
  
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = @period.purchases

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.json
  def new
    @purchase = Purchase.new
    @purchase.purchase_lines.push(PurchaseLine.new)
    @purchase.market = Market.new
    @markets = Market.all.collect(&:name)
    @products = Product.all.collect(&:name)
    @brands = Brand.all.collect(&:name)
    respond_to do |format|
      format.html # new.html.erb
      format.js 
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.joins(:market, purchase_lines: [:product, :brand]).find(params[:id])
    @markets = Market.all.collect(&:name)
    @products = Product.all.collect(&:name)
    @brands = Brand.all.collect(&:name)
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.json
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.js
        else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:id, :purchase_date, purchase_lines_attributes: [:id, :_destroy, :quantity, :price, product_attributes: [:name], brand_attributes: [:name]], market_attributes: [:name])
  end
end
