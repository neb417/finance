Rails.application.routes.draw do
  resources :fixed_expenses
  root "dashboard#index"
  resources :incomes
end
