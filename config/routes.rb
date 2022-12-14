# typed: strict

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'posts#index'

  resources :posts do
    resources :comments
  end

  resources :paginate_posts, only: [:index]
end
