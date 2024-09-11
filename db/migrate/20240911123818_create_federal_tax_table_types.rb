class CreateFederalTaxTableTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :federal_tax_table_types do |t|
      t.string :filing_status

      t.timestamps
    end

    add_reference :federal_tax_brackets, :federal_tax_table_type, foreign_key: true
  end
end
