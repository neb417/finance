class IncomesController < ApplicationController
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
        @salary_taxed = Income.tax_on_income(income_type: "Salary")
        @hourly_taxed = Income.tax_on_income(income_type: "Hourly")
        @fixed_expenses = FixedExpense.get_ordered
        @total_annual_cost = FixedExpense.total_annual_cost
        @total_monthly_cost = FixedExpense.total_monthly_cost
        @total_bi_weekly_cost = FixedExpense.total_bi_weekly_cost
        format.html { redirect_to root_path, notice: "Income was successfully updated." }
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
            locals: build_locals(salary))
        }
      end
    else
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("salary_budget",
            partial: "budget/hourly_budget",
            locals: build_locals(hourly))
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

  def build_locals(income)
    income_fixed_expense = IncomeFixedExpenseService.new

    {
      total_annual_cost: income_fixed_expense.total_annual_cost,
      total_monthly_cost: income_fixed_expense.total_monthly_cost,
      total_bi_weekly_cost: income_fixed_expense.total_bi_weekly_cost,
      income: income
    }
  end

  def hourly
    Income.tax_on_income(income_type: "Hourly")
  end

  def salary
    Income.tax_on_income(income_type: "Salary")
  end
end
