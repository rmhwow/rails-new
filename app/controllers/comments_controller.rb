class CommentsController < ApplicationController
  def show
    @comments = Comment.all
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @comment.post = post
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      # render :new
    end
  end
end
