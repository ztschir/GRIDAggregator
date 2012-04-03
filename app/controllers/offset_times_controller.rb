class OffsetTimesController < ApplicationController
  # GET /offset_times
  # GET /offset_times.json
  def index
    @offset_times = OffsetTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offset_times }
    end
  end

  # GET /offset_times/1
  # GET /offset_times/1.json
  def show
    @offset_time = OffsetTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offset_time }
    end
  end

  # GET /offset_times/new
  # GET /offset_times/new.json
  def new
    @offset_time = OffsetTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offset_time }
    end
  end

  # GET /offset_times/1/edit
  def edit
    @offset_time = OffsetTime.find(params[:id])
  end

  # POST /offset_times
  # POST /offset_times.json
  def create
    @offset_time = OffsetTime.new(params[:offset_time])

    respond_to do |format|
      if @offset_time.save
        format.html { redirect_to @offset_time, notice: 'Offset time was successfully created.' }
        format.json { render json: @offset_time, status: :created, location: @offset_time }
      else
        format.html { render action: "new" }
        format.json { render json: @offset_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offset_times/1
  # PUT /offset_times/1.json
  def update
    @offset_time = OffsetTime.find(params[:id])

    respond_to do |format|
      if @offset_time.update_attributes(params[:offset_time])
        format.html { redirect_to @offset_time, notice: 'Offset time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offset_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offset_times/1
  # DELETE /offset_times/1.json
  def destroy
    @offset_time = OffsetTime.find(params[:id])
    @offset_time.destroy

    respond_to do |format|
      format.html { redirect_to offset_times_url }
      format.json { head :no_content }
    end
  end
end
