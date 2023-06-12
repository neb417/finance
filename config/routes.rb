Rails.application.routes.draw do
  resources :federal_tax_brackets
  resources :fixed_expenses
  root "dashboard#index"
  resources :incomes
end
