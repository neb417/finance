# == Schema Information
#
# Table name: fixed_expenses
#
#  id                      :bigint           not null, primary key
#  annual_cost_cents       :integer          default(0), not null
#  annual_cost_currency    :string           default("USD"), not null
#  bi_weekly_cost_cents    :integer          default(0), not null
#  bi_weekly_cost_currency :string           default("USD"), not null
#  expense_name            :string
#  monthly_cost_cents      :integer          default(0), not null
#  monthly_cost_currency   :string           default("USD"), not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class FixedExpense < ApplicationRecord
  monetize :annual_cost_cents
  monetize :monthly_cost_cents
  monetize :bi_weekly_cost_cents

  def self.new_from_dashboard(params:)
    expense = params[:fixed_expense]
    amount = (expense[:amount].to_f * 100).to_i
    case expense[:frequency]
    when "monthly"
      FixedExpense.new(
        expense_name: expense[:expense_name],
        annual_cost_cents: amount * 12,
        monthly_cost_cents: amount,
        bi_weekly_cost_cents: (amount * 12) / 26
      )
    when "annually"
      FixedExpense.new(
        expense_name: expense[:expense_name],
        annual_cost_cents: amount,
        monthly_cost_cents: amount / 12,
        bi_weekly_cost_cents: amount / 26
      )
    else
      FixedExpense.new
    end
  end

  def update_from_dashboard(params:)
    frequency = params[:frequency]
    amount = (params[:amount].to_f * 100).to_i
    case frequency
    when "monthly"
      update(
        expense_name: params[:expense_name],
        annual_cost_cents: amount * 12,
        monthly_cost_cents: amount,
        bi_weekly_cost_cents: (amount * 12) / 26
      )
    when "annually"
      update(
        expense_name: params[:expense_name],
        annual_cost_cents: amount,
        monthly_cost_cents: amount / 12,
        bi_weekly_cost_cents: amount / 26
      )
    else
      false
    end
  end

  def self.total_costs
    OpenStruct.new(
      total_annual_cost: sum(&:annual_cost_cents).to_f / 100,
      total_monthly_cost: sum(&:monthly_cost_cents).to_f / 100,
      total_bi_weekly_cost: sum(&:bi_weekly_cost_cents).to_f / 100
    )
  end

  def self.get_ordered
    all.order(annual_cost_cents: :desc)
  end
end
