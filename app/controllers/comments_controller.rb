class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find_by slug: params[:post_id]
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = 'Your comment was added'
      redirect_to post_url(@post)
    else
      render 'posts/show'
    end
  end
end
