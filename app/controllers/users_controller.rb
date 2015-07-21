class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:show]
  def show
     @user = User.find(params[:id])
     @posts = @user.posts.visible_to(current_user)
     @comments = @user.comments
  end

   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
 
  def down_vote_link_classes(post)
    base = "glyphicon glyphicon-chevron-down "
    vote = current_user.voted(post)
    base += "voted" if vote && vote.down_vote?
    base
  end

  def up_vote_link_classes(post)
    base = "glyphicon glyphicon-chevron-up "
    vote = current_user.voted(post)
    base += "voted" if vote && vote.up_vote?
    base
  end


   private
 
   def user_params
     params.require(:user).permit(:name,:avatar, :email_favorites)
   end
end
