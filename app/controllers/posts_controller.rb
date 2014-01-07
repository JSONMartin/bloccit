class PostsController < ApplicationController

## Depricated Code
=begin  
  def index
    @posts = Post.all
  end
=end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    authorize! :create, Post, message: "You need to be a member to create a new post."
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params[:post])
    @post.topic = @topic

    authorize! :create, @post, message: "You need to be signed up to do that."
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to be authorized to do that."
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize! :update, @post, message: "You need to be authorized to do that."
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

end
