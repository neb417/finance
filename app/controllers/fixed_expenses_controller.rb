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
    @fixed_expense = FixedExpense.new(fixed_expense_params)

    respond_to do |format|
      if @fixed_expense.save
        format.html { redirect_to fixed_expense_url(@fixed_expense), notice: "Fixed expense was successfully created." }
        format.json { render :show, status: :created, location: @fixed_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fixed_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixed_expenses/1 or /fixed_expenses/1.json
  def update
    respond_to do |format|
      if @fixed_expense.update(fixed_expense_params)
        format.html { redirect_to fixed_expense_url(@fixed_expense), notice: "Fixed expense was successfully updated." }
        format.json { render :show, status: :ok, location: @fixed_expense }
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
      format.html { redirect_to fixed_expenses_url, notice: "Fixed expense was successfully destroyed." }
      format.json { head :no_content }
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
