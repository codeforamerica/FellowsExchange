FellowsExchange::Application.routes.draw do
  get "home/index"

  root :to => "welcome#index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
