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

  def self.savings
    find_by(name: 'savings')
  end

  def self.investing
    find_by(name: 'investing')
  end

  def display_rate
    (rate * 100)
  end

  def update_from_dashboard(params:)
    rate = params[:rate].to_f / 100
    update(rate: rate)
  end
end
