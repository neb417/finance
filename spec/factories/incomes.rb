# == Schema Information
#
# Table name: incomes
#
#  id                     :bigint           not null, primary key
#  hours                  :integer
#  income_type            :string
#  rate_cents             :integer          default(0), not null
#  rate_currency          :string           default("USD"), not null
#  weekly_income_cents    :integer          default(0), not null
#  weekly_income_currency :string           default("USD"), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
FactoryBot.define do
  factory :income do
    income_type { "Salary" }
    rate_cents { 5_000_000 }
    hours { 40 }
    weekly_income_cents { 5_000_000 / 52 }

    trait :hourly do
      income_type { "Hourly" }
      rate_cents { 300_000 }
      hours { 40 }
      weekly_income_cents { 300_000 * 40 }
    end

    trait :with_all_types do
      after :create do |_record|
        create(:income, :hourly)
      end
    end

    # to_create do |instance|
    #   instance.id = Income.find_or_create_by(income_type: instance.income_type).id
    #   instance.reload
    # end
  end
end
