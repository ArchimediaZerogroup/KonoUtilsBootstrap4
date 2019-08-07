Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :contacts, only: [:create,:new]
  end

  resources :contacts

  root to: "users#index"
end
