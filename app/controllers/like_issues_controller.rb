class LikeIssuesController < ApplicationController
  def index 
    likes = LikeIssue.all

    render json: likes
  end
end