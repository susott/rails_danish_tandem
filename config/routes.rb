Rails.application.routes.draw do
  get 'profiles/index'

  get 'profiles/show'

  get 'me', to: 'profiles#my_dashboard', as: :dashboard

  devise_for :users, controllers: { registrations: 'users/registrations' } do
    resources :language_skills, only: [:create, :update, :destroy]
  end

  root to: 'pages#home'

  get "pages/design", to: "pages#design"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
