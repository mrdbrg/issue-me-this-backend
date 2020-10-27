class LikeIssuesController < ApplicationController
  def index 
    likes = LikeIssue.all

    render json: likes
  end

  def destroy 
    like = LikeIssue.find_by(issue_id: params[:id], user_id: 21)
    # byebug
    like.destroy
    render json: {like: LikeIssueSerializer.new(like)}
  end
end