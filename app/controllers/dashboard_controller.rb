class DashboardController < ApplicationController
  include DashboardBuilder
  include Stream

  def index
    build_dashboard_variables!
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def switch_taxable_income
    build_dashboard_variables!
    render_respond_to(render_dashboard)
  end
end
