# == Schema Information
#
# Table name: federal_tax_table_types
#
#  id            :bigint           not null, primary key
#  filing_status :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "rails_helper"

RSpec.describe FederalTaxTableType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
