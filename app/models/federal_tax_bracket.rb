# == Schema Information
#
# Table name: federal_tax_brackets
#
#  id                    :bigint           not null, primary key
#  bottom_range_cents    :integer          default(0), not null
#  bottom_range_currency :string           default("USD"), not null
#  cumulative_cents      :integer          default(0), not null
#  cumulative_currency   :string           default("USD"), not null
#  rate                  :float
#  tier                  :string
#  top_range_cents       :integer          default(0), not null
#  top_range_currency    :string           default("USD"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class FederalTaxBracket < ApplicationRecord
  monetize :bottom_range_cents
  monetize :top_range_cents
  monetize :cumulative_cents

  def self.order_by_range
    all.order(:bottom_range_cents)
  end

  def update_rate(rate:)
    update(
      rate: rate / 100
    )
  end
end
