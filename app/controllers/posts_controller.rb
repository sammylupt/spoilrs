class PostsController < ApplicationController
  before_filter :check_for_current_user, only: :new
  before_filter :decrypt_from_params, only: :show

  def new
    @post = Post.new
  end

  def show
  end

  def create
    # TODO
    @post = current_user.posts.build(post_params)
    if @post.save
      @post.tweet!
      redirect_to @post
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:content,:secret,:post_id)
  end

  def decrypt_from_params
    @post = Post.decrypt(params[:id])
  end

end