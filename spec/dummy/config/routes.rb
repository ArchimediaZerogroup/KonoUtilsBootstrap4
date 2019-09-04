Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    namespace :users do
      resources :contacts, only: [:create, :new]
      resources :documents, only: [:create, :new]
    end
  end


  resources :contacts

  root to: "users#index"
end
