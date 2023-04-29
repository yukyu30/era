Rails.application.routes.draw do
  resources :notes
  #health check
  get '/healthz', to: 'healthz#index'
end
