Rails.application.routes.draw do

  # get 'messages/index'

  # get 'messages/create'

  # get 'messages/new'

  get 'language_skills/create'

  resources :profiles, only: [:update]
  resources :profiles, only: [:index, :show]


  get 'me', to: 'profiles#my_dashboard', as: :dashboard
  get 'profile/:id', to: 'profiles#show', as: :profile
  patch 'profile/:id', to: 'profiles#update'
  get 'profiles', to: 'profiles#index', as: :profiles

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, except: [ :new, :create, :edit, :update, :destroy, :index, :show ] do
    resources :language_skills, only: [:create, :update, :destroy]
    resources :messages, only: [:create, :new, :index]
  end

  root to: 'pages#home'

  get "pages/design", to: "pages#design"
  get "pages/about", to: "pages#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
