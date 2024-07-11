# frozen_string_literal: true

class CreateIncomes < ActiveRecord::Migration[7.0]
  def up
    Income.create(income_type: "Salary", rate: 100000, hours: 40, weekly_income: 1923.08)
    Income.create(income_type: "Hourly", rate: 4700, hours: 40, weekly_income: 1880.0)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
