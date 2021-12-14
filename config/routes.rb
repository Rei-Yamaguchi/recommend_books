Rails.application.routes.draw do


  resources :posts
  devise_for :users, controllers: { registrations: 'registrations' }
  get "users/show" => "users#show"

  resources :posts, only: %i[index new create show] do
    resources :responses, only: %i[create], shallow: true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  
end
