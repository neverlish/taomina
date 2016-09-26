Rails.application.routes.draw do
  root 'home#index'
  get '/about' => 'home#about'
  resources :projects
  post 'uploads' => 'uploads#create'
  delete 'delete_file' => 'uploads#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
