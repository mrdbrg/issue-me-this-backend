class LikeCommentsController < ApplicationController
  def index 
    likes = LikeComment.all

    render json: likes
  end

  def create 
    comment = Comment.find_by(id: params[:comment_id])
    # byebug

    like = LikeComment.create(
      is_like: params[:like_status],
      user_id: params[:user_id],
      comment_id: comment.id
    )

    if like.valid?
      render json: { like: LikeCommentSerializer.new(like), comment: CommentSerializer.new(comment), errorStatus: false }
    else
      render json: { header: "#{like.errors.full_messages.count} errors occurred.", error: like.errors.full_messages, errorStatus: true  }, status: :bad_request
    end

  end

  def destroy 
    # byebug
    like = LikeComment.find_by(id: params[:id])
    comment = Comment.find_by(id: like.comment_id)
    like.destroy
    render json: {like: LikeCommentSerializer.new(like), comment: CommentSerializer.new(comment)}
  end
end
