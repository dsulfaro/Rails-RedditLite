class PostsController < ApplicationController
  # def index
  # end
  before_action :require_login, only: [:new, :edit, :create, :update]

  def show
    @post = Post.find_by(id: params[:id])
    unless @post
      flash[:errors] = @post.errors.full_messages
      redirect_to posts_url
    end
    render :show
  end

  def new
    @post = Post.new
    @post.sub_ids = [params[:sub_id]]
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # fail

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end


  def edit
    @post = Post.find_by(id: params[:id])
    if @post
      if current_user == @post.author
        render :edit
      else
        flash[:errors] = ["You. shall not. PASS!"]
        redirect_to post_url(@post)
      end
    else
      flash[:errors] = ["404 page not found either...."]
      redirect_to posts_url
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post
      if current_user == @post.author
        # render :edit
        if @post.update(post_params)
        else
          flash[:errors] = @post.errors.full_messages
        end
        redirect_to post_url(@post)
      else
        flash[:errors] = ["You. shall not. PASS!"]
        redirect_to post_url(@post)
      end
    else
      flash[:errors] = ["404 page not found either...."]
      redirect_to posts_url
    end
  end
  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
