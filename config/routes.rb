Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  resources :tags, param: :slug, only: [:show]
end
