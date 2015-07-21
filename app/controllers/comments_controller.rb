class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "Comment failed to save."
    end
    redirect_to [@post.topic,@post]
  end

  def destroy
    # @topic = @post.topic
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    redirect_to [@post.topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
