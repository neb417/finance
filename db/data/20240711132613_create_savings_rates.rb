# frozen_string_literal: true

class CreateSavingsRates < ActiveRecord::Migration[7.0]
  def up
    SavingsRate.create(name: "savings", rate: 0.2)
    SavingsRate.create(name: "investing", rate: 0.2)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
