class CommentsController < ApplicationController
  def index
    comments = Comment.all

    render json: comments
  end

  def create
    user = User.find_by(id: params[:user_id])
    issue = Issue.find_by(id: params[:issue_id])

    comment = Comment.create(
      title: params[:comment][:title],
      comment_body: params[:comment][:comment_body],
      user: user,
      issue: issue
    )

    if comment.valid?
      render json: comment
    else
      render json: { message: "Something went wrong while creating this comment." }, status: :bad_request
    end
  end

  def destroy 
    comment = Comment.find_by(id: paramsp[:id])
    comment.destroy
  end
end
