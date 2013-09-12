EcoFamily::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  get 'spends/balance/:year/:month' => 'spends#balance', :as => :balance
  #get 'spends/history/:year/:month' => 'spends#index', :as => :spend_history
  resources :spends
  
  resources :products do
    resources :price_lines, only: [:index, :create, :new]
  end
  
  get 'purchases/history/:year/:month' => 'purchases#index', :as => :purchase_history
  resources :purchases

  get 'periods/:year/:month/spends' => 'spends#index', as: :spend_history
  root :to => "spends#index"
end
