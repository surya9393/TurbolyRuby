Rails.application.routes.draw do
  get 'task/index'
  devise_for :users
  root "home#homepage"
  get '/dashboard', to: 'home#dashboard'



  get '/task', to: 'task#index'
  post '/task/new', to: 'task#create'
  get '/task/delete/:id', to: 'task#destroy'
  get '/task/details/:id', to: 'task#details'
  get '/task/search', to: 'task#search', :as => :task_search

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
