class PostsController < ApplicationController
  before_filter :authenticate, :only => [:mercury_update, :new, :destroy, :edit]

  def index
  	@posts = Post.all(:order => 'created_at DESC')
  end

  def new 
    @post = Post.create(:title => "Title", :body => "Body")
    redirect_to post_path(@post)
  end 

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root
  end 

  def show
  	@post = Post.find(params[:id])
  end

  def mercury_update
    post = Post.find(params[:id])
    post.title = params[:content][:post_title][:value]
    post.body = params[:content][:post_body][:value]
    post.save!
    render text: ""
  end 

  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
    user == "username" && password == "password"
    end 
  end 
end
