Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts do
          resources :comments
          resources :likes
        end
      end
    end
  end  
end
