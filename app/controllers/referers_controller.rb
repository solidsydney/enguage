class ReferersController < ApplicationController
  # GET /referers
  # GET /referers.json
  def index
    @referers = Referer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @referers }
    end
  end

  # GET /referers/1
  # GET /referers/1.json
  def show
    @referer = Referer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @referer }
    end
  end

  # GET /referers/new
  # GET /referers/new.json
  def new
    @referer = Referer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @referer }
    end
  end

  # GET /referers/1/edit
  def edit
    @referer = Referer.find(params[:id])
  end

  # POST /referers
  # POST /referers.json
  def create
    @referer = Referer.new(params[:referer])

    respond_to do |format|
      if @referer.save
        format.html { redirect_to @referer, notice: 'Referer was successfully created.' }
        format.json { render json: @referer, status: :created, location: @referer }
      else
        format.html { render action: "new" }
        format.json { render json: @referer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /referers/1
  # PUT /referers/1.json
  def update
    @referer = Referer.find(params[:id])

    respond_to do |format|
      if @referer.update_attributes(params[:referer])
        format.html { redirect_to @referer, notice: 'Referer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @referer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referers/1
  # DELETE /referers/1.json
  def destroy
    @referer = Referer.find(params[:id])
    @referer.destroy

    respond_to do |format|
      format.html { redirect_to referers_url }
      format.json { head :no_content }
    end
  end
end
