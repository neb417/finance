class IncomesController < ApplicationController
  include DashboardBuilder
  include TotalCost
  include SaveIncome
  include GuiltFree
  include Stream

  before_action :set_income, only: %i[show edit update destroy]

  # GET /incomes or /incomes.json
  def index
    @incomes = Income.all

    respond_to do |format|
      format.html
      format.turbo_stream
    end
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
    build_dashboard_variables!
    if params[:enabled] == "0"
      render_respond_to(switch_to_salary)
    else
      render_respond_to(switch_to_hourly)
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

  # def build_locals(taxed_income)
  #   income = taxed_income.income
  #   build_dashboard_variables!
  #   {
  #     total_annual_cost: @total_annual_cost,
  #     total_monthly_cost: @total_monthly_cost,
  #     total_bi_weekly_cost: @total_bi_weekly_cost,
  #     income: taxed_income,
  #     investing_amount: income.is_hourly? ? @hourly_invest : @salary_invest,
  #     savings_amount: income.is_hourly? ? @hourly_saving : @salary_saving,
  #     guilt_free: income.is_hourly? ? @guilt_free_hourly : @guilt_free_salary
  #   }
  # end
end
