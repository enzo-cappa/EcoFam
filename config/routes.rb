EcoFamily::Application.routes.draw do
  devise_for :users

  get 'spends/balance/:year/:month' => 'spends#balance', :as => :balance
  #get 'spends/history/:year/:month' => 'spends#index', :as => :spend_history
  resources :spends
  resources :products
  get 'purchases/history/:year/:month' => 'purchases#index', :as => :purchase_history
  resources :purchases

  get 'periods/:year/:month/spends' => 'spends#index', as: :spend_history
  
  root :to => "spends#index"
end
