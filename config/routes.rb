Rails.application.routes.draw do

  # get 'messages/index'

  # get 'messages/create'

  # get 'messages/new'

  get 'language_skills/create'

  resources :profiles, only: [:show, :update, :index]
  # resources :profiles, only: [:index, :show, :update]


  get 'me', to: 'profiles#my_dashboard', as: :dashboard

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}

  resources :users, except: [ :new, :create, :edit, :update, :destroy, :index, :show ] do
    resources :language_skills, only: [:create, :update, :destroy]
    resources :messages, only: [:create, :new, :index]
  end

  root to: 'pages#home'

  get "pages/design", to: "pages#design"
  get "pages/about", to: "pages#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
