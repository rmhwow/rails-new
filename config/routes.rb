Rails.application.routes.draw do
 devise_for :users
 resources :questions
 resources :users, only: [:update, :show, :index]

  resources :advertisements
  # ,only: [:show]
  resources :posts, only: [:index] do
  resources :summaries, except: [:index]
end

  # resources :posts do
  #   resources :comments, only: [:create]
  # end
  # get 'advertisements#show'

  # resources :posts
    resources :topics do
     resources :posts, except: [:index], controller: 'topics/posts'
   end
     resources :posts, only: [:index] do
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
   end
   
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  
end
