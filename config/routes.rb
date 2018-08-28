Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }
    root 'frontpage#index'
    resources :contact, only: [:index]
    resources :about_germany, only: [:index]
    resources :comment_articles, only: [:index, :show]
    resources :news_articles, only: [:index, :show]
    resources :users, only: [:show]
    resources :profile, only: [:index, :show]
    namespace :admin do
      root 'news_articles#index'
      resources :comment_articles
      resources :news_articles
      resources :users
      resources :profile
      resources :images
    end
end
