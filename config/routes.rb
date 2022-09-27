Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index] do
        resources :posts, only: %i[index show] do
          resources :comments, only: %i[index new create] do
          end
        end
      end
    end
  end  
end
