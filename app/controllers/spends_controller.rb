class SpendsController < ApplicationController
  # GET /spends
  # GET /spends.xml
  def index
    @spends = Spend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spends }
    end
  end

  # GET /spends/1
  # GET /spends/1.xml
  def show
    @spend = Spend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spend }
    end
  end

  # GET /spends/new
  # GET /spends/new.xml
  def new
    @spend = Spend.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spend }
    end
  end

  # GET /spends/1/edit
  def edit
    @spend = Spend.find(params[:id])
  end

  # POST /spends
  # POST /spends.xml
  def create
    @spend = Spend.new(params[:spend])

    respond_to do |format|
      if @spend.save
        format.html { redirect_to(:action => 'index', :notice => 'Spend was successfully created.') }
        format.xml  { render :xml => @spend, :status => :created, :location => @spend }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spends/1
  # PUT /spends/1.xml
  def update
    @spend = Spend.find(params[:id])

    respond_to do |format|
      if @spend.update_attributes(params[:spend])
        format.html { redirect_to(@spend, :notice => 'Spend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spends/1
  # DELETE /spends/1.xml
  def destroy
    @spend = Spend.find(params[:id])
    @spend.destroy

    respond_to do |format|
      format.html { redirect_to(spends_url) }
      format.xml  { head :ok }
    end
  end
end
