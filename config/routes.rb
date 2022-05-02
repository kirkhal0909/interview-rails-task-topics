Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :tags, param: :slug, only: [:show]
  get '/topics/*url_path/:slug', to: 'topics#show', as: 'topic'
end
