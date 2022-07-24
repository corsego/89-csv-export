Rails.application.routes.draw do
  resources :posts
  root to: redirect('/users')
  resources :users do
    collection do
      post :import
    end
  end
end
