Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:show, :new, :create, :update] do
    resources :comments, only: [:create]
  end

  get "/unpublished_articles", to: "articles#unpublished", as: "unpublished"

end
