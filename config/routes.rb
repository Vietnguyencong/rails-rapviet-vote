Rails.application.routes.draw do
  resources :rappers do
    member do #change to get
      put 'like', to: 'rappers#upvote'
      # match 'like',to: 'rappers#upvote', via: [:get, :put]
      # put 'dislike', to: 'rappers#downvote'
    end
  end
  # special controller that manage the response when the user's info send back to us
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'home#index'
  get 'home/index'
  get 'home/rules'

  # get 'sessions#new', to: 'application#page_not_found'

  #get 404 page for production
  # if Rails.env.production?
  #   get '404', :to => 'application#page_not_found'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
