Rails.application.routes.draw do
  resources :federal_tax_brackets
  resources :fixed_expenses
  root "dashboard#index"
  resources :incomes
  post "/income_switch", to: "incomes#income_switch"
end
