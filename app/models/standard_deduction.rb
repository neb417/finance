# == Schema Information
#
# Table name: standard_deductions
#
#  id              :bigint           not null, primary key
#  amount_cents    :integer          default(0), not null
#  amount_currency :string           default("USD"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class StandardDeduction < ApplicationRecord
  monetize :amount_cents

  validates :amount_cents, presence: true
  validates :amount_currency, presence: true
end
