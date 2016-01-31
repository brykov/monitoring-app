Rails.application.routes.draw do

  root to: 'application#home'
  resources :nodes do
    post :shutdown, on: :member
  end

end
