Rails.application.routes.draw do
 devise_for :users
 resources :questions
 resources :users, only: [:update]
 # resources :topics

  resources :advertisements
  # ,only: [:show]
  resources :posts do
  resources :summaries
end

  # get 'advertisements#show'

  # resources :posts
    resources :topics do
     resources :posts, except: [:index]
   end
   
  get 'about' => 'welcome#about'

  root to: 'welcome#index'




  
end
