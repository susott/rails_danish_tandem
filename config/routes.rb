Rails.application.routes.draw do
  get 'profiles/index'

  get 'profiles/show'

  devise_for :users do
    resources :language_skills, only: [:create, :update, :destroy]
  end

  root to: 'pages#home'

  get "pages/design", to: "pages#design"
  get "pages/about", to: "pages#about"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
