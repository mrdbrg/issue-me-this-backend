class IssuesController < ApplicationController
  def index
    issues = Issue.all

    render json: issues
  end

  def create
    # issue = Issue.create(
        # title: params[:title], 
        # issue_body: params[:issue_body], 
        # issue: params[:id], 
        # user: params[:user_id]
        # )
    # byebug
  end

  def show
    myIssue = Issue.find_by(id: params[:id])
    # byebug
    render json: myIssue
  end
end
