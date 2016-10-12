class LoadsController < ApplicationController
  before_action :set_load, only: [:show, :edit, :update, :destroy]

  # GET /loads
  # GET /loads.json
  def index
    @loads = Load.all
  end

  # GET /loads/1
  # GET /loads/1.json
  def show
  end

  # GET /loads/new
  def new
    @load = Load.new
  end

  # GET /loads/1/edit
  def edit
  end

  # POST /loads
  # POST /loads.json
  def create
    @load = Load.new(load_params)

    respond_to do |format|
      if @load.save
        format.html { redirect_to @load, notice: 'Load was successfully created.' }
        format.json { render :show, status: :created, location: @load }
      else
        format.html { render :new }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loads/1
  # PATCH/PUT /loads/1.json
  def update
    respond_to do |format|
      if @load.update(load_params)
        format.html { redirect_to @load, notice: 'Load was successfully updated.' }
        format.json { render :show, status: :ok, location: @load }
      else
        format.html { render :edit }
        format.json { render json: @load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loads/1
  # DELETE /loads/1.json
  def destroy
    @load.destroy
    respond_to do |format|
      format.html { redirect_to loads_url, notice: 'Load was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_orders
    @assignOrders = Order.where(load_id: params[:load_id])
    @unassignOrders = Order.where(load_id: nil)
    @load = Load.find(params[:load_id])
  end

  def download

  end

  def upload_orders
    require 'csv'

    csv_text = params[ :csv_file ].tempfile.read
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      params = row.to_hash
      originAddress = params.slice(:origin_raw_line_1, :origin_city, :origin_state, :origin_zip, :origin_country)
      destinationAddress = params.slice(:destination_raw_line_1, :destination_city, :destination_state, :destination_zip, :destination_country)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_load
      @load = Load.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def load_params
      params.require(:load).permit(:deliveryDate, :deliveryShift, :driver_id)
    end
end
