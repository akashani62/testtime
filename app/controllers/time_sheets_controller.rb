class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: %i[ show edit update destroy clock_out ]

  # GET /time_sheets or /time_sheets.json
  def index
    @time_sheets = current_user.time_sheets.all
  end

  # GET /time_sheets/1 or /time_sheets/1.json
  def show
  end

  # GET /time_sheets/new
  def new
    @time_sheet = current_user.time_sheets.new
  end

  # GET /time_sheets/1/edit
  def edit
  end

  # POST /time_sheets or /time_sheets.json
  def create
    # byebug
    @time_sheet = current_user.time_sheets.new(clock_in: DateTime.now.localtime)

    respond_to do |format|
      if @time_sheet.save
        format.html { redirect_to @time_sheet, notice: "Time sheet was successfully created." }
        format.json { render :show, status: :created, location: @time_sheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def clock_out
    respond_to do |format|
      if @time_sheet.update(clock_out: DateTime.now.localtime)
        format.html { redirect_to @time_sheet, notice: "Time sheet was clocked out." }
        format.json { render :show, status: :ok, location: @time_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_sheets/1 or /time_sheets/1.json
  def update
    respond_to do |format|
      if @time_sheet.update(time_sheet_params)
        format.html { redirect_to @time_sheet, notice: "Time sheet was successfully updated." }
        format.json { render :show, status: :ok, location: @time_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_sheets/1 or /time_sheets/1.json
  def destroy
    @time_sheet.destroy
    respond_to do |format|
      format.html { redirect_to time_sheets_url, notice: "Time sheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_sheet
      @time_sheet = current_user.time_sheets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_sheet_params
      params.require(:time_sheet).permit(:clock_in, :clock_out)
    end
end
