class CreateFixedExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_expenses do |t|
      t.string :expense_name
      t.monetize :annual_cost
      t.monetize :monthly_cost
      t.monetize :bi_weekly_cost

      t.timestamps
    end
  end
end
