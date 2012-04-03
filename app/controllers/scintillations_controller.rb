class ScintillationsController < ApplicationController
  # GET /scintillations
  # GET /scintillations.json
  def index
    @scintillations = Scintillation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scintillations }
    end
  end

  # GET /scintillations/1
  # GET /scintillations/1.json
  def show
    @scintillation = Scintillation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scintillation }
    end
  end

  # GET /scintillations/new
  # GET /scintillations/new.json
  def new
    @scintillation = Scintillation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scintillation }
    end
  end

  # GET /scintillations/1/edit
  def edit
    @scintillation = Scintillation.find(params[:id])
  end

  # POST /scintillations
  # POST /scintillations.json
  def create
    @scintillation = Scintillation.new(params[:scintillation])

    respond_to do |format|
      if @scintillation.save
        format.html { redirect_to @scintillation, notice: 'Scintillation was successfully created.' }
        format.json { render json: @scintillation, status: :created, location: @scintillation }
      else
        format.html { render action: "new" }
        format.json { render json: @scintillation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scintillations/1
  # PUT /scintillations/1.json
  def update
    @scintillation = Scintillation.find(params[:id])

    respond_to do |format|
      if @scintillation.update_attributes(params[:scintillation])
        format.html { redirect_to @scintillation, notice: 'Scintillation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scintillation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scintillations/1
  # DELETE /scintillations/1.json
  def destroy
    @scintillation = Scintillation.find(params[:id])
    @scintillation.destroy

    respond_to do |format|
      format.html { redirect_to scintillations_url }
      format.json { head :no_content }
    end
  end
end
