# == Schema Information
#
# Table name: federal_tax_table_types
#
#  id            :bigint           not null, primary key
#  filing_status :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class FederalTaxTableType < ApplicationRecord
  has_many :federal_tax_brackets

  FILING_TYPES = %w(single married_filing_jointly married_filing_separately head_of_household)
  validates :filing_status, presence: true, inclusion: FILING_TYPES
end
