Rails.application.routes.draw do
  root "dashboard#index"
  resources :incomes
end
