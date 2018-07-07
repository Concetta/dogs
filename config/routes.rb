Rails.application.routes.draw do
  devise_for :users

  root 'videos#index'

  resources :videos do
    resources :comments
    member do
      put "like", to: "videos#liked"
      put "dislike", to: "videos#unliked"
    end
  end

  resources :comments do
    resources :comments
  end

end
