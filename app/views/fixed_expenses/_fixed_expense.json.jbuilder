json.extract! fixed_expense, :id, :expense_name, :annual_cost, :monthly_cost, :bi_weekly_cost, :created_at, :updated_at
json.url fixed_expense_url(fixed_expense, format: :json)
