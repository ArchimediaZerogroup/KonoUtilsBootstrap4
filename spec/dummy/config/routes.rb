Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :users do
    resources :searches, :only => [:index, :create]
  end

  resources :users do
    namespace :users do
      resources :contacts, only: [:create, :new]
      resources :documents, only: [:create, :new, :edit, :update]
    end
  end
  namespace :users do
    resources :documents, only: [:destroy]
  end


  resources :contacts

  root to: "users#index"
end
