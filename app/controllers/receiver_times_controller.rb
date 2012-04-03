class ReceiverTimesController < ApplicationController
  # GET /receiver_times
  # GET /receiver_times.json
  def index
    @receiver_times = ReceiverTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receiver_times }
    end
  end

  # GET /receiver_times/1
  # GET /receiver_times/1.json
  def show
    @receiver_time = ReceiverTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receiver_time }
    end
  end

  # GET /receiver_times/new
  # GET /receiver_times/new.json
  def new
    @receiver_time = ReceiverTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receiver_time }
    end
  end

  # GET /receiver_times/1/edit
  def edit
    @receiver_time = ReceiverTime.find(params[:id])
  end

  # POST /receiver_times
  # POST /receiver_times.json
  def create
    @receiver_time = ReceiverTime.new(params[:receiver_time])

    respond_to do |format|
      if @receiver_time.save
        format.html { redirect_to @receiver_time, notice: 'Receiver time was successfully created.' }
        format.json { render json: @receiver_time, status: :created, location: @receiver_time }
      else
        format.html { render action: "new" }
        format.json { render json: @receiver_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /receiver_times/1
  # PUT /receiver_times/1.json
  def update
    @receiver_time = ReceiverTime.find(params[:id])

    respond_to do |format|
      if @receiver_time.update_attributes(params[:receiver_time])
        format.html { redirect_to @receiver_time, notice: 'Receiver time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receiver_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receiver_times/1
  # DELETE /receiver_times/1.json
  def destroy
    @receiver_time = ReceiverTime.find(params[:id])
    @receiver_time.destroy

    respond_to do |format|
      format.html { redirect_to receiver_times_url }
      format.json { head :no_content }
    end
  end
end
