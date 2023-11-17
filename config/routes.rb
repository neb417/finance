Rails.application.routes.draw do
  resources :federal_tax_brackets
  resources :fixed_expenses
  root "dashboard#index"
  resources :incomes
  post "/income_switch", to: "incomes#income_switch"
  post "/saving_rate", to: "savings#saving_rate"
  post "/investing_rate", to: "savings#investing_rate"
end
