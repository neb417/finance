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
require 'rails_helper'

RSpec.describe StandardDeduction, type: :model do
  it { is_expected.to validate_presence_of(:amount_cents) }
  it { is_expected.to validate_presence_of(:amount_currency) }
end
