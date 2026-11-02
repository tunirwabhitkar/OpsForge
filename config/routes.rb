Rails.application.routes.draw do
  root "dashboard#index"

  resource :session, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]

  resources :organizations, only: [:new, :create, :edit, :update] do
    member do
      post :switch
    end
  end

  namespace :crm do
    resources :companies do
      resources :activities, only: [:create]
    end
    resources :contacts
    resources :deals do
      collection do
        get :pipeline
      end
    end
    resources :tasks
  end

  namespace :ats do
    resources :jobs
    resources :candidates
    resources :applications do
      resources :interviews
    end
  end

  namespace :kb do
    resources :categories
    resources :articles
  end

  namespace :support do
    resources :tickets do
      resources :ticket_comments, only: [:create]
    end
  end

  resources :integrations, only: [:index, :create, :destroy]
  get "search", to: "search#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
