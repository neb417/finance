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

  after_create_commit -> { broadcast_append_to :fixed_expense, partial: "fixed_expenses/fixed_expense", locals: {fixed_expense: self} }
  after_update_commit -> { broadcast_replace_to self }
  after_destroy_commit -> { broadcast_remove_to :fixed_expense, target: dom_id(self, :index) }

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
        bi_weekly_cost_cents: amount / 52
      )
    else
      FixedExpense.new
    end
  end
end
