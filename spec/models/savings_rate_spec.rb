# == Schema Information
#
# Table name: savings_rates
#
#  id         :bigint           not null, primary key
#  name       :string
#  rate       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe SavingsRate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
