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
FactoryBot.define do
  factory :savings_rate do
    name { "MyString" }
    rate { 1.5 }
  end
end
