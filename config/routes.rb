Rails.application.routes.draw do
  resources :blogs do 
  resources :comments
  end
   resources :blogs
  resources :comments

  get 'contact/new'
  get 'contact/create'
  root 'static_pages#home'
  get '/home' , to: "static_pages#home"
  get '/about' ,to: 'static_pages#about'
  get '/faq' ,to: 'static_pages#faq'
  get '/contact' ,to: "static_pages#contact"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
