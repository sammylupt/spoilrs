class PostsController < ApplicationController
  before_filter :check_for_current_user, only: :new

  def new
    @post = Post.new
  end

  def create
    throw params
    # TODO
    #@post = current_user.posts.build(post_params)
    if @post.save
      #
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:content,:secret,:post_id)
  end

end