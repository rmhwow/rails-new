class SummariesController < ApplicationController


  def new
    @post = Post.find(params[:post_id])
    # @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
    authorize @post
  end
    def create
    # @topic = Topic.find(params[:topic_id]
    @post = Post.find(params[:post_id]) # make sure your view is sending in a post object.
    @summary = Summary.new(params.require(:summary).permit(:title, :body)) 
    @summary.post = @post # and if you made the change as above, this line would not be necessary.
    authorize @post
    if @summary.save
      flash[:notice] = "Post was saved."
      redirect_to [@post, @summary] # at this point, @post and @summary should have objects of the respective class and you should be redirected 
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    # @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @post
  end

  def edit
     # @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @summary = Summary.find(params[:id])
     authorize @post
  end
    def update
    # @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @summary = Summary.find(params[:id])
     authorize @post
     if @summary.update_attributes(params.require(:summary).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@post, @summary]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
end
