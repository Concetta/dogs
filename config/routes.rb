Rails.application.routes.draw do
  devise_for :users

  root 'videos#index'

  resources :videos do
    member do
      put "like", to: "videos#liked"
      put "dislike", to: "videos#unliked"
    end
  end

end
