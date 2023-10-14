Rails.application.routes.draw do
  devise_for :users
  

  get 'alohas/food' => 'alohas#food'
  get 'alohas/spot' => 'alohas#spot'
  get 'alohas/leisure' => 'alohas#leisure'
  get 'alohas/omiyage' => 'alohas#omiyage'
  

  resources :alohas ,only: [:index, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create]
  end
  namespace :admin do
    resources :alohas, only: [:new]
  end
  
  root 'alohas#index'

end