FellowsExchange::Application.routes.draw do
  resources :users, :only => [:index, :edit, :show, :update]

  get "home/index"

  root :to => "welcome#index"

  match "/auth/:provider/callback" => "sessions#create"
  get '/auth/failure', :to => 'sessions#error', :as => 'failure'
  match "/signout" => "sessions#destroy", :as => :signout


end
