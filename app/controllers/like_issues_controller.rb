class LikeIssuesController < ApplicationController
  def index 
    likes = LikeIssue.all

    render json: likes
  end

  def destroy 
    # byebug
    like = LikeIssue.find_by(issue_id: params[:id], user: params[:user_id])
    issue = Issue.find_by(id: like.issue_id)
    user = User.find_by(id: params[:user_id])
    like.destroy
    render json: {like: LikeIssueSerializer.new(like), user: UserSerializer.new(user), issue: IssueSerializer.new(issue)}
  end
end