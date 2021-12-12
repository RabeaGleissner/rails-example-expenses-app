Rails.application.routes.draw do
  resources :expense_reports do
    get 'approve', to: 'expense_reports#approve'
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
