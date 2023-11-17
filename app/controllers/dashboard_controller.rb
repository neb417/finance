class DashboardController < ApplicationController
  include DashboardBuilder

  def index
    build_dashboard_variables!
  end
end
