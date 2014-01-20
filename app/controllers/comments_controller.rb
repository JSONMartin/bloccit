class CommentsController < ApplicationController

  respond_to :html, :js

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user

    authorize! :create, @comment, message: "You need to be signed up to do that."
    if @comment.save
      flash[:notice] = "Comment was saved successfully."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error creating comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize! :destroy, @comment, message: "You must own this comment to do that."

    if @comment.destroy
      flash[:notice] = "Comment was deleted successfully."
    else
      flash[:error] = "Error deleting post, please try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
    
  end

end
