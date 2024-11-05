class DashboardController < ApplicationController
  include DashboardBuilder
  include Stream

  def index
    build_dashboard_variables!
  end

  def switch_taxable_income
    build_dashboard_variables!
    render_respond_to(render_dashboard)
  end
end
