class CommentsController < ApplicationController
  def index
    # comments = Comment.all.order('created_at ASC')
    comments = Comment.all

    render json: comments
  end

  def create
    user = User.find_by(id: params[:user_id])
    issue = Issue.find_by(id: params[:issue_id])

    # if both the user and the issue were value 
    comment = Comment.create(
      comment_body: params[:comment][:comment_body],
      syntax: params[:comment][:syntax],
      user: user,
      issue: issue
    )
    # validates comment
    if comment.valid?
      render json: { issue: IssueSerializer.new(issue), comment: CommentSerializer.new(comment), errorStatus: false }
    else
      # return comment errors
      render json: { header: "#{comment.errors.full_messages.count} errors occured with your submission", error: comment.errors.full_messages, errorStatus: true  }, status: :bad_request
    end
  end

  def update
    comment = Comment.find_by(id: params[:id])

    comment.update(comment_body: params[:comment_body])
    # comment.update(syntax: params[:syntax])

    if comment.valid? 
      render json: { comment: CommentSerializer.new(comment), errorStatus: false }
    else
      render json: { header: "Make sure to be as detailed as possible.", error: comment.errors.full_messages, errorStatus: true }, status: :bad_request
    end
  end

  def destroy 
    comment = Comment.find_by(id: params[:id])
    issue = Issue.find_by(id: comment.issue_id)
    comment.destroy
    render json: {comment: CommentSerializer.new(comment), issue: IssueSerializer.new(issue)}
  end
end
