class CommentsController < ApplicationController
  before_filter :load_post
  
  def load_post
    @post = Post.find(params[:post_id]);
  end
  
  def create
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
