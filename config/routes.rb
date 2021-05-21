Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, only: %i[new create show] do
    resources :bookmarks, only: %i[new create]
  end
  get 'movies/search', to: 'bookmarks#getMovie'
  resources :bookmarks, only: %i[destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
