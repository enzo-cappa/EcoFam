class PriceLinesController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @price_line = PriceLine.new
    @price_line.product = @product
    @markets = Market.all.collect(&:name)
    @brands = Brand.all.collect(&:name)
    respond_to do |format|
      format.js
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @price_line = PriceLine.new(price_line_params)
    @price_line.product = @product
    @price_line.user = current_user
    @price_line.user_group = current_user.user_group
    
    respond_to do |format|
      if @price_line.save
        format.js
      else
        format.js
      end
    end
  end

  def index
    @data_by_market = {}
    price_lines = PriceLine.where("price_lines.product_id = ?", params[:product_id]).where(['price_lines.date > ?', Time.now - 6.months])
    
    price_lines.each do |price|
      market_name = price.market.name
      @data_by_market[market_name] = [] if @data_by_market[market_name].nil?
      @data_by_market[market_name] << [price.date, price.price]
    end

    respond_to do |format|
      format.js
    end
  end

  private
  def price_line_params
    params.require(:price_line).permit(:date, :price, brand_attributes: [:name], market_attributes: [:name])
  end
end
