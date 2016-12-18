Rails.application.routes.draw do

  devise_for :users
  resources :projects
  resources :posts
  resources :cart

  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id/add' => 'cart#add'
  get '/cart' => 'cart#index'

  root 'home#index'

  get '/about' => 'home#about'
  get '/terms-of-use' => 'home#terms'
  get '/imprint' => 'home#imprint'
  get '/contact' => 'home#contact'
  get '/index' => 'home#index'

  get '/shop' => 'home#shop'
  get '/shop/:id' => 'home#shopitem'

  post 'uploads' => 'uploads#create'
  delete 'delete_file' => 'uploads#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
