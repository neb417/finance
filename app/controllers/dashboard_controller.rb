class DashboardController < ApplicationController
  def index
    @incomes = Income.all
  end
end
