Rails.application.routes.draw do
  resource :users, only: [ :create ]
  resource :posts, only: [ :create ]

  get "up" => "rails/health#show", as: :rails_health_check
end
