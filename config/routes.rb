FellowsExchange::Application.routes.draw do
  resources :users, :only => [:index, :edit, :update]

  get "home/index"

  root :to => "welcome#index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
