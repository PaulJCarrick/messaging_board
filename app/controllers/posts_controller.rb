class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    if user_signed_in?
      @post = current_user.posts.build
    else
      flash[:alert] = 'You must be logged in to Post.'

      redirect_to root_path
    end
  end

  def create
    if user_signed_in?
      @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to root_path
      else
        flash[:alert] = 'There was a problem saving the post.'

        render 'new'
      end
    else
      flash[:alert] = 'You must be logged in to Post.'

      redirect_to root_path
    end
  end

  def update
    if !user_signed_in?
      flash[:alert] = 'You must be logged in to Post.'
      redirect_to root_path
    elsif @post.user_id != current_user.try(:id)
      flash[:alert] = "You cannot update another user's post!"
      redirect_to root_path
    elsif @post.update(post_params)
      redirect_to post_path
    else
      flash[:alert] = 'There was a problem updating the post.'

      render 'edit'
    end
  end

  def edit
    if user_signed_in?
      render
    else
      flash[:alert] = 'You must be logged in to Edit a Post.'
      redirect_to root_path
    end
  end

  def destroy
    if !user_signed_in?
      flash[:alert] = 'You must be logged in to delete.'
    elsif @post.user_id != current_user.try(:id)
      flash[:alert] = "You cannot delete another user's post!"
    else
      @post.destroy
    end

    redirect_to root_path
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    render
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
