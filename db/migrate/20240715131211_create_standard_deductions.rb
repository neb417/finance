class CreateStandardDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :standard_deductions do |t|
      t.monetize :amount

      t.timestamps
    end
  end
end
