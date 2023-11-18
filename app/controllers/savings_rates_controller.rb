class SavingsRatesController < ApplicationController
  include DashboardBuilder

  before_action :set_savings_rate, only: %i[ show edit update destroy ]

  # GET /savings_rates or /savings_rates.json
  def index
    @savings_rates = SavingsRate.all
  end

  # GET /savings_rates/1 or /savings_rates/1.json
  def show
  end

  # GET /savings_rates/new
  def new
    @savings_rate = SavingsRate.new
  end

  # GET /savings_rates/1/edit
  def edit
  end

  # POST /savings_rates or /savings_rates.json
  def create
    @savings_rate = SavingsRate.new(savings_rate_params)

    respond_to do |format|
      if @savings_rate.save
        format.html { redirect_to savings_rate_url(@savings_rate), notice: "Savings rate was successfully created." }
        format.json { render :show, status: :created, location: @savings_rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @savings_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings_rates/1 or /savings_rates/1.json
  def update
    respond_to do |format|
      if @savings_rate.update_from_dashboard(params: savings_rate_params)
        # calculate new savings amounts for both hourly and salary and new guilt free
        build_dashboard_variables!
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @savings_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings_rates/1 or /savings_rates/1.json
  def destroy
    @savings_rate.destroy

    respond_to do |format|
      format.html { redirect_to savings_rates_url, notice: "Savings rate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_savings_rate
      @savings_rate = SavingsRate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def savings_rate_params
      params.require(:savings_rate).permit(:name, :rate)
    end
end
