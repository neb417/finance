class FixedExpensesController < ApplicationController
  before_action :set_fixed_expense, only: %i[show edit update destroy]

  # GET /fixed_expenses or /fixed_expenses.json
  def index
    @fixed_expenses = FixedExpense.all
  end

  # GET /fixed_expenses/1 or /fixed_expenses/1.json
  def show
  end

  # GET /fixed_expenses/new
  def new
    @fixed_expense = FixedExpense.new
  end

  # GET /fixed_expenses/1/edit
  def edit
  end

  # POST /fixed_expenses or /fixed_expenses.json
  def create
    @fixed_expense = FixedExpense.new_from_dashboard(params: params)

    respond_to do |format|
      if @fixed_expense.save
        @totals = FixedExpense.total_costs
        @fixed_expenses = FixedExpense.get_ordered
        format.html { redirect_to root_path, notice: "Fixed expense was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fixed_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixed_expenses/1 or /fixed_expenses/1.json
  def update

    respond_to do |format|
      if @fixed_expense.update_from_dashboard(params: params[:fixed_expense])
        @totals = FixedExpense.total_costs
          format.html { redirect_to root_path, notice: "Fixed expense was successfully updated." }
          format.turbo_stream
      else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @fixed_expense.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /fixed_expenses/1 or /fixed_expenses/1.json
  def destroy
    @fixed_expense.destroy
    respond_to do |format|
      format.html { redirect_to fixed_expenses_path, notice: "Fixed expense was successfully destroyed." }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@fixed_expense) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fixed_expense
    @fixed_expense = FixedExpense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fixed_expense_params
    params.require(:fixed_expense).permit(:expense_name, :annual_cost, :monthly_cost, :bi_weekly_cost)
  end
end
