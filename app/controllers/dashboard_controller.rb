class DashboardController < ApplicationController
  def index
    @incomes = Income.all
    @fixed_expenses = FixedExpense.all
  end
end
