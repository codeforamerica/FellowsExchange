FellowsExchange::Application.routes.draw do
  root :to => "welcome#index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end
