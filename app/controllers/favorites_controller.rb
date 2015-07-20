class FavoritesController < ApplicationController
   
   def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
      
      authorize favorite

     if favorite.save
        flash[:notice] = "This post has been favorited!"
       redirect_to [post.topic, post]
     else
        flash[:notice] = "There was an error favoriting this post. Please try again!"
        redirect_to [post.topic, post]
     end
   end
    def destroy
      # why does it have to be @post here? 
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])
    
    authorize favorite

      if favorite.destroy
        flash[:notice] = "Removed favorite."
        redirect_to [post.topic, post]
      else
        flash[:error] = "Unable to remove favorite. Please try again."
        redirect_to [post.topic, post]
      end
    end
end
