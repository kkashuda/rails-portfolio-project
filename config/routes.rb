Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do 
    resources :pins 
    
  end 
  
  resources :pins
  root to: "pins#index"

  resources :categories

  resources :pins do
    member do
      put 'like', to: 'pins#upvote'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
