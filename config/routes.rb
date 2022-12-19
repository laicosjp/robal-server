Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users, param: :hash_id, only: [:show]
    end
  end
end
