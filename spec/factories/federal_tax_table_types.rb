# == Schema Information
#
# Table name: federal_tax_table_types
#
#  id            :bigint           not null, primary key
#  filing_status :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :federal_tax_table_type do
    filing_status { "single" }

    trait :married_filing_jointly do
      filing_status { "married_filing_jointly" }
    end

    trait :married_filing_separately do
      filing_status { "married_filing_separately" }
    end

    trait :head_of_household do
      filing_status { "head_of_household" }
    end

    trait :with_all_statuses do
      after :create do |_record|
        create(:federal_tax_table_type, :married_filing_jointly)
        create(:federal_tax_table_type, :married_filing_separately)
        create(:federal_tax_table_type, :head_of_household)
      end
    end
  end
end
