class DashboardController < ApplicationController
  include DashboardConcern
  def index
    build_instance_variables
  end
end
