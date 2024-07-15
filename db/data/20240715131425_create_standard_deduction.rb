# frozen_string_literal: true

class CreateStandardDeduction < ActiveRecord::Migration[7.0]
  def up
    #  2024 Standard Deduction is $13,850
    StandardDeduction.create(amount: 13_850)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
