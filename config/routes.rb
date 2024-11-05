Rails.application.routes.draw do
  resources :savings_rates
  resources :federal_tax_brackets
  resources :fixed_expenses
  root "dashboard#index"
  resources :incomes
  post "/income_switch", to: "incomes#income_switch"
  post "/switch_taxable_income", to: "dashboard#switch_taxable_income", as: "switch_taxable_income"
end
