Rails.application.routes.draw do

  root to: redirect('/nodes')
  resources :nodes do
    post :shutdown, on: :member
  end

end
