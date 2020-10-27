class LikeIssuesController < ApplicationController
  def index 
    likes = LikeIssue.all

    render json: likes
  end

  def create 
    user = User.find_by(id: params[:user_id])
    issue = Issue.find_by(id: params[:issue_id])
    like = LikeIssue.create(
      is_like: params[:like_status],
      user_id: user.id,
      issue_id: issue.id
    )

    if like.valid?
      render json: { like: like, issue: IssueSerializer.new(issue), errorStatus: false }
    else
      render json: { header: "#{like.errors.full_messages.count} errors occured with your submission", error: like.errors.full_messages, errorStatus: true  }, status: :bad_request
    end

  end

  def destroy 
    # byebug
    like = LikeIssue.find_by(id: params[:id])
    issue = Issue.find_by(id: like.issue_id)
    like.destroy
    render json: {like: like, issue: IssueSerializer.new(issue)}
  end
end