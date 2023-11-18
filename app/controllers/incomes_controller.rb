class IncomesController < ApplicationController
  include DashboardBuilder
  include TotalCost
  include SaveIncome

  before_action :set_income, only: %i[show edit update destroy]

  # GET /incomes or /incomes.json
  def index
    @incomes = Income.all
  end

  # GET /incomes/1 or /incomes/1.json
  def show
  end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit
  end

  # POST /incomes or /incomes.json
  def create
    @income = Income.new(income_params)

    respond_to do |format|
      if @income.update_from_dashboard(params:)
        format.html { redirect_to root_path, notice: "Income was successfully created." }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1 or /incomes/1.json
  def update
    respond_to do |format|
      if @income.update_from_dashboard(params: params)
        build_dashboard_variables!
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1 or /incomes/1.json
  def destroy
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url, notice: "Income was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def income_switch
    if params[:enabled] == "0"
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("hourly_budget",
            partial: "budget/salary_budget",
            locals: build_locals(tax_on_salary))
        }
      end
    else
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("salary_budget",
            partial: "budget/hourly_budget",
            locals: build_locals(tax_on_hourly))
        }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_income
    @income = Income.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def income_params
    params.require(:income).permit(:income_type, :rate, :hours, :weekly_income)
  end

  def build_locals(taxed_income)
    income = taxed_income.income
    build_total_cost_vars!
    build_savings_vars!
    {
      total_annual_cost: @total_annual_cost,
      total_monthly_cost: @total_monthly_cost,
      total_bi_weekly_cost: @total_bi_weekly_cost,
      income: taxed_income,
      investing_amount: income.is_hourly? ? @hourly_invest : @salary_invest,
      savings_amount: income.is_hourly? ? @hourly_saving : @salary_saving
    }
  end
end
