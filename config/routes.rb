Rails.application.routes.draw do
  get 'likes/index'
  get 'likes/show'
  get 'comments/new'
  get 'comments/create'
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
    end
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  namespace :api do 
    namespace :v1 do
      resources :users, only:  %i[show] do
        resources :posts, only:  %i[index show] do
          resources :comments, only:  %i[index new create] do
          end
        end
      end
    end
  end
end