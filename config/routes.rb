Rails.application.routes.draw do
  get '/', to: 'shelters#index'
  get '/shelters', to: 'shelters#index'
end
