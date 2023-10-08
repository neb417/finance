module SetDashboardInstanceVariables
  extend ActiveSupport::Concern

  included do
    # before_action :set_variables
  end

  def set_variables
    Rails.logger.debug "**** Dashboard Vars Being Set ****"
    @totals = FixedExpense.total_costs
  end
end
