Rails.application.routes.draw do
  root to: 'pages#home'

  get '/api', to: 'pages#api'
end
