class Topics::PostsController < ApplicationController
  skip_before_action :flash_attack, :only => [:new, :index]
  # def index
  #   @posts = Post.all
  #   authorize @posts
  # end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @summary = @post.summary
    @comments = @post.comments
    @comment = Comment.new
    authorize @post
    authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    @post.topic = @topic

    authorize @post
  end
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    @post.user = current_user

    authorize @post
    if @post.save_with_initial_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic,@post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

    def edit
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:id])
     authorize @post
   end

   def update
    @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic,@post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
 
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

   private

def post_params
  params.require(:post).permit(:title, :body, :image)
end

end
