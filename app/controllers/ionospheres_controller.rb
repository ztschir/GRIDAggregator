class IonospheresController < ApplicationController
  # GET /ionospheres
  # GET /ionospheres.json
  def index
    @ionospheres = Ionosphere.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ionospheres }
    end
  end

  # GET /ionospheres/1
  # GET /ionospheres/1.json
  def show
    @ionosphere = Ionosphere.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ionosphere }
    end
  end

  # GET /ionospheres/new
  # GET /ionospheres/new.json
  def new
    @ionosphere = Ionosphere.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ionosphere }
    end
  end

  # GET /ionospheres/1/edit
  def edit
    @ionosphere = Ionosphere.find(params[:id])
  end

  # POST /ionospheres
  # POST /ionospheres.json
  def create
    @ionosphere = Ionosphere.new(params[:ionosphere])

    respond_to do |format|
      if @ionosphere.save
        format.html { redirect_to @ionosphere, notice: 'Ionosphere was successfully created.' }
        format.json { render json: @ionosphere, status: :created, location: @ionosphere }
      else
        format.html { render action: "new" }
        format.json { render json: @ionosphere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ionospheres/1
  # PUT /ionospheres/1.json
  def update
    @ionosphere = Ionosphere.find(params[:id])

    respond_to do |format|
      if @ionosphere.update_attributes(params[:ionosphere])
        format.html { redirect_to @ionosphere, notice: 'Ionosphere was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ionosphere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ionospheres/1
  # DELETE /ionospheres/1.json
  def destroy
    @ionosphere = Ionosphere.find(params[:id])
    @ionosphere.destroy

    respond_to do |format|
      format.html { redirect_to ionospheres_url }
      format.json { head :no_content }
    end
  end
end
