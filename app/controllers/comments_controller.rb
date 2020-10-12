class CommentsController < ApplicationController
  def index
    comments = Comment.all

    render json: comments
  end

  def create
    user = User.find_by(id: params[:user_id])
    issue = Issue.find_by(id: params[:issue_id])

    # if both the user and the issue were value 
    comment = Comment.create(
      title: params[:comment][:title],
      comment_body: params[:comment][:comment_body],
      user: user,
      issue: issue
    )
    
    # validates comment
    if comment.valid?

      render json: { comment: CommentSerializer.new(comment), issue: IssueSerializer.new(issue), errorStatus: false }
    else
      # return comment errors
      render json: { header: "#{comment.errors.full_messages.count} errors occured with your submission", error: comment.errors.full_messages, errorStatus: true  }, status: :bad_request
    end
  end

  def destroy 
    comment = Comment.find_by(id: params[:id])
    comment.destroy
  end
end
