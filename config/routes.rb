Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts do
    end
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  # namespace :api do 
  #   namespace :v1 do
  #     resources :users, only:  %i[show] do
  #       resources :posts, only:  %i[index show] do
  #         resources :comments, only:  %i[index new create] do
  #         end
  #       end
  #     end
  #   end
  # end
end
