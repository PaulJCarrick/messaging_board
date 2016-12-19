class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all.order('created_at DESC')
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    render
  end

  # GET /comments/new
  def new
    if user_signed_in?
      @comment = Comment.new
    else
      flash[:alert] = 'You must be logged in to comment.'
      redirect_to root_path
    end
  end

  # GET /comments/1/edit
  def edit
    if user_signed_in?
      render
    elsif @comment.user_id != current_user.try(:id)
      flash[:alert] = "You cannot edit another user's comment!"
      redirect_to root_path
    else
      flash[:alert] = 'You must be logged in to edit a comment.'
      redirect_to root_path
    end
  end

  # POST /comments
  def create
    if user_signed_in?
      @comment         = @post.comments.create(comment_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to post_path(@post)
      else
        flash[:alert] = 'There was a problem saving the comment.'

        render 'new'
      end
    else
      flash[:alert] = 'You must be logged in to comment.'
      redirect_to root_path
    end
  end

  # PATCH/PUT /comments/1
  def update
    if user_signed_in?
      if @comment.user_id != current_user.try(:id)
        flash[:alert] = "You cannot update another user's comment!"

        redirect_to root_path
      elsif @comment.update(comment_params)
        redirect_to post_path(@post)
      else
        flash[:alert] = 'Cannot update comment.'

        render 'edit'
      end
    else
      flash[:alert] = 'You must be logged in to edit a comment.'

      redirect_to root_path
    end
  end

  # DELETE /comments/1
  def destroy
    if user_signed_in?
      if @comment.user_id != current_user.try(:id)
        flash[:alert] = "You cannot delete another user's comment!"

        redirect_to root_path
      else
        @comment.destroy

        redirect_to post_path(@post)
      end
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
