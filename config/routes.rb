Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :tags, param: :slug, only: [:show]

  resources :topics, path: '/topics/*url_path/', param: :slug, only: [:show]
end
