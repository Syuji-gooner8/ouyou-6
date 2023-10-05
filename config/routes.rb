Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users
   resources :users, only: [:show,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
   end
   resources :books do
   resource :favorites, only: [:create, :destroy]
   resources:book_comments,only:[:create,:destroy]
   end
   resources :groups, only: [:new, :index, :show, :create, :edit, :update]

   resources :users, only: [:show,:edit,:update]
   resources :messages, only: [:create]
   resources :rooms, only: [:create,:show]

  root to: "homes#top"
  get "home/about"=>"homes#about",as: "about"
  get 'users' => 'users#index'
  get "search" => "searches#search"
  delete '/books' => 'books#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
