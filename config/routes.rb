Rails.application.routes.draw do

  root to: redirect('/nodes')
  resources :nodes do
    post :shutdown, on: :member
  end

  resource :report, only: [] do
    get 'highest-cpu', to: 'reports#highest_cpu'
    get 'low-disk-space', to: 'reports#low_disk_space'
  end


end
