Rails.application.routes.draw do
  root "dashboar#index"
  resources :incomes
end
