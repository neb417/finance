class CreateSavingsRates < ActiveRecord::Migration[7.0]
  def change
    create_table :savings_rates do |t|
      t.string :name
      t.float :rate

      t.timestamps
    end
  end
end
