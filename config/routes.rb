Rails.application.routes.draw do
  resources :rappers do
    member do #change to get
      get 'like', to: 'rappers#upvote'
      # put 'dislike', to: 'rappers#downvote'
    end
  end
  # special controller that manage the response when the user's info send back to us
  devise_scope :user do
    put 'get_lucky_number', to: 'home#get_lucky_number'
  end
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'home#index'
  get 'home/index'
  get 'home/rules'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
