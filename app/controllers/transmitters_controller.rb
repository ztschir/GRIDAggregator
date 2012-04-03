class TransmittersController < ApplicationController
  # GET /transmitters
  # GET /transmitters.json
  def index
    @transmitters = Transmitter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transmitters }
    end
  end

  # GET /transmitters/1
  # GET /transmitters/1.json
  def show
    @transmitter = Transmitter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transmitter }
    end
  end

  # GET /transmitters/new
  # GET /transmitters/new.json
  def new
    @transmitter = Transmitter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transmitter }
    end
  end

  # GET /transmitters/1/edit
  def edit
    @transmitter = Transmitter.find(params[:id])
  end

  # POST /transmitters
  # POST /transmitters.json
  def create
    @transmitter = Transmitter.new(params[:transmitter])

    respond_to do |format|
      if @transmitter.save
        format.html { redirect_to @transmitter, notice: 'Transmitter was successfully created.' }
        format.json { render json: @transmitter, status: :created, location: @transmitter }
      else
        format.html { render action: "new" }
        format.json { render json: @transmitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transmitters/1
  # PUT /transmitters/1.json
  def update
    @transmitter = Transmitter.find(params[:id])

    respond_to do |format|
      if @transmitter.update_attributes(params[:transmitter])
        format.html { redirect_to @transmitter, notice: 'Transmitter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transmitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transmitters/1
  # DELETE /transmitters/1.json
  def destroy
    @transmitter = Transmitter.find(params[:id])
    @transmitter.destroy

    respond_to do |format|
      format.html { redirect_to transmitters_url }
      format.json { head :no_content }
    end
  end
end
