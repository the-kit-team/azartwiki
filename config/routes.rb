Rails.application.routes.draw do

  root to: 'wiki#index', as: 'root'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :wiki

  get '/home' => 'home#index'

  controller :sessions do
    get 'login'  => :new
    post 'login'  => :create
    delete 'logout' => :destroy
  end
end
