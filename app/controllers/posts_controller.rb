class PostsController < ApplicationController
  layout 'general'

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)
    @posts = @posts.paginate(page: params[:page], per_page: 2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post could not be created'
      render :new, locals: { post: @post }
    end
  end
end
