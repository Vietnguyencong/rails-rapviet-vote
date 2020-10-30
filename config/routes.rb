Rails.application.routes.draw do
  # special controller that manage the response when the user's info send back to us 
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  root 'home#page'
  get 'home/page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
