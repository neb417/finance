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
  pending "add some examples to (or delete) #{__FILE__}"
end
