class PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_member.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)

    @favorite = Favorite.find(params[:favorite_id])
    #投稿に紐づいたコメントを作成
    @comment = @favorite.comments.build(comment_params)
    @comment.member_id = current_member.id
    @comment_favorite = @comment.favorite
    if @comment.save
      #通知の作成
      @comment_favorite.create_notification_comment!(current_member, @comment.id)
      render :index
    end

    @member = Member.find(params[:following_id])
      current_member.follow(@member)
      #通知の作成
      @member.create_notification_follow!(current_member)
  end



  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
