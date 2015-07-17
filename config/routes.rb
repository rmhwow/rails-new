Rails.application.routes.draw do
 devise_for :users
 resources :questions
 resources :users, only: [:update]

  resources :advertisements
  # ,only: [:show]
  resources :posts do
  resources :summaries
end

  # resources :posts do
  #   resources :comments, only: [:create]
  # end
  # get 'advertisements#show'

  # resources :posts
    resources :topics do
     resources :posts, except: [:index] do 
       resources :comments, only: [:create, :show]
      end
   end
   
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  
end
