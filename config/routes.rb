Rails.application.routes.draw do
  get "profile/me"
  get "up" => "rails/health#show", as: :rails_health_check
  post "/register", to: "authentication#register"
  post "/login", to: "authentication#login"
  post "/logout", to: "authentication#logout"

  get "/me", to: "profile#me"
end
