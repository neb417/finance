class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.string :income_type
      t.monetize :rate
      t.integer :hours
      t.monetize :weekly_income

      t.timestamps
    end
  end
end
