class CommentsController < ApplicationController
  def new
    #@post = Post.find(params[:post_id])
    #@comment = @post.comments.new
    #@comment.user = @post.user
    #@comment = current_user.comments.create(params[:comment])
    #self.create
    #@comment = @post.comments.new
    authorize! :create, Comment, message: "You need to be a member to create a comment."
  end

  def create
    #@comment = current_user.posts.comments.build(params[:comment])
    #@post = Post.find(params[:post_id])
    #@comment = current_user.comments.create(params[:comment])
    #@comment.user = @post.user
    #@comment = @post.comments.build(params[:comment])
    #@user = current_user
    #@comment = @user.comments.build(params[:comment])
    #@comment.user = current_user.id
    
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user = current_user

    authorize! :create, @comment, message: "You need to be signed up to do that."
    if @comment.save
      flash[:notice] = "Comment was saved successfully."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error creating comment. Please try again."
      render :new
    end
  end

end
