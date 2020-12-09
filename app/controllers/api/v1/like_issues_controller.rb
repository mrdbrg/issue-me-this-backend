class Api::V1::LikeIssuesController < ApplicationController

  def index 
    likes = LikeIssue.all
    render json: likes
  end

  def create 
    issue = Issue.find_by(id: params[:issue_id])

    like = LikeIssue.create(
      is_like: params[:like_status],
      user_id: params[:user_id],
      issue_id: issue.id
    )

    if like.valid?
      render json: { like: LikeIssueSerializer.new(like), issue: IssueSerializer.new(issue), errorStatus: false }
    else
      render json: { header: "#{like.errors.full_messages.count} errors occured with your submission", error: like.errors.full_messages, errorStatus: true  }, status: :bad_request
    end

  end

  def destroy 
    like = LikeIssue.find_by(id: params[:id])
    issue = Issue.find_by(id: like.issue_id)
    like.destroy
    render json: {like: LikeIssueSerializer.new(like), issue: IssueSerializer.new(issue)}
  end

  private 
  # strong params will be add here soon
  
end