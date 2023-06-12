class CreateFederalTaxBrackets < ActiveRecord::Migration[7.0]
  def change
    create_table :federal_tax_brackets do |t|
      t.string :tier
      t.monetize :bottom_range
      t.monetize :top_range
      t.float :rate
      t.monetize :cumulative

      t.timestamps
    end
  end
end
