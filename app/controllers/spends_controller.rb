class SpendsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_filter :by_period, only: [:index, :balance]
  # GET /spends
  # GET /spends.xml
  def index
    @spends = current_user.spends.where(period_id: @period.id)

    if params[:with_tag]
      @tag = params[:with_tag]
      @spends = @spends.tagged_as(@tag)
    end
    
    @sum = Spend.balance(@spends)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /spends/1
  # GET /spends/1.xml
  def show
    @spend = current_user.spends.find(params[:id])
    @tags = @spend.tags.where.not(name: "confirmar")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spend }
    end
  end

  # GET /spends/new
  # GET /spends/new.xml
  def new
    @spend = Spend.new
    @tags = @spend.tags
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spend }
      format.js 
    end
  end

  # GET /spends/1/edit
  def edit
    @spend = Spend.find(params[:id])
    @tags = @spend.tags_not_confirm
    respond_to do |format|
      format.html
      format.xml  { render :xml => @spend }
      format.js 
    end
  end

  # POST /spends
  # POST /spends.xml
  def create
    #FIXME: This is ugly....
    tags = from_tags_listing(params[:spend].delete(:tags_listing))
    @spend = Spend.new(spend_params)
    @spend.user = current_user
    @spend.user_group = current_user.user_group
    @spend.tags << tags
    respond_to do |format|
      if @spend.save
        format.html { redirect_to spends_path, :flash => { :notice => t("msg.creation.success")} }
        format.xml  { render :xml => @spend, :status => :created, :location => @spend }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spend.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /spends/1
  # PUT /spends/1.xml
  def update
    tags = from_tags_listing(params[:spend].delete(:tags_listing))
    @spend = current_user.spends.find(params[:id])
    @spend.tags = tags
    respond_to do |format|      
      if @spend.update_attributes(spend_params)
        format.html { redirect_to spends_path, :flash => { :notice => t("msg.update.success")} }        
        format.js
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  # DELETE /spends/1
  # DELETE /spends/1.xml
  def destroy
    @spend = current_user.spends.find(params[:id])
    @spend.destroy

    respond_to do |format|
      format.html { redirect_to(spends_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
  def balance
    spends = current_user.spends.where(period_id: @period.id)
    
    if params[:with_tag]
      tag = params[:with_tag]
      spends = spends.tagged_as(tag)
    end
    
    sum = Spend.balance(spends)
    
    respond_to do |format|
      format.json { render :json => {:balance => number_to_currency(sum)} }
    end
  end

  private
  def spend_params
    params.require(:spend).permit(:spend_date, :titulo, :amount, :needs_confirmation)
  end
end
