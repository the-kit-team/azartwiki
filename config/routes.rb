Rails.application.routes.draw do
  root to: 'home#index', as: 'root'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  controller :sessions do
    get 'login'  => :new
    post 'login'  => :create
    delete 'logout' => :destroy
  end
end
