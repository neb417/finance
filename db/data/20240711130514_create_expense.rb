# frozen_string_literal: true

class CreateExpense < ActiveRecord::Migration[7.0]
  def up
    FixedExpense.create(expense_name: "Rent", annual_cost: 12000, monthly_cost: 100, bi_weekly_cost: 461.54)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
