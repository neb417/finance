# == Schema Information
#
# Table name: federal_tax_brackets
#
#  id                        :bigint           not null, primary key
#  bottom_range_cents        :integer          default(0), not null
#  bottom_range_currency     :string           default("USD"), not null
#  cumulative_cents          :integer          default(0), not null
#  cumulative_currency       :string           default("USD"), not null
#  rate                      :float
#  tier                      :string
#  top_range_cents           :integer          default(0), not null
#  top_range_currency        :string           default("USD"), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  federal_tax_table_type_id :bigint
#
# Indexes
#
#  index_federal_tax_brackets_on_federal_tax_table_type_id  (federal_tax_table_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (federal_tax_table_type_id => federal_tax_table_types.id)
#
require "rails_helper"

RSpec.describe FederalTaxBracket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
