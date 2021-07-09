Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:show, :new, :create, :update]

  get "/unpublished_articles", to: "articles#unpublished", as: "unpublished"

end
