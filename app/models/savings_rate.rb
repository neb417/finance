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
class SavingsRate < ApplicationRecord
  SAVING_TYPES = %w[savings investing]
  validates :name, presence: true, inclusion: SAVING_TYPES
end
