# frozen_string_literal: true

module Stream
  include DashboardBuilder
  include TaxedIncome

  def render_respond_to(turbo_replace)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_replace
      end
    end
  end

  def switch_to_hourly
    [
      turbo_stream.replace("salary_budget",
        partial: "budget/hourly_budget",
        locals: build_locals(tax_on_hourly))
    ]
  end

  def switch_to_salary
    [
      turbo_stream.replace("hourly_budget",
        partial: "budget/salary_budget",
        locals: build_locals(tax_on_salary))
    ]
  end

  def render_dashboard
    [
      turbo_stream.replace("primary_frame", partial: "dashboard/index")
    ]
  end
end
