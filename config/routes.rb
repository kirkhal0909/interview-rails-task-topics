Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root 'topics#index'
  resources :tags, param: :slug, only: [:show]
  resources :topics, only: [:index]
  get '/topics/*url_path/:slug', to: 'topics#show', as: 'topic'

  scope :api do
    get '/tags', to: 'api#tags'
    get '/topics', to: 'api#topics'
    get '/topic/*url_path/:slug', to: 'api#topic'
  end
end
