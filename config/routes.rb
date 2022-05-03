Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :tags, param: :slug, only: [:show]
  resources :topics, only: [:index]
  get '/topics/*url_path/:slug', to: 'topics#show', as: 'topic'
end
