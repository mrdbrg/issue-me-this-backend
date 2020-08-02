class IssuesController < ApplicationController
  def index
    issues = Issue.all

    render json: issues
  end

  def create
    user = User.find_by(id: params[:user_id])
    newIssue = Issue.create(
        title: params[:issue][:title], 
        issue_body: params[:issue][:issue_body], 
        user: user
      )
      # byebug

    if newIssue.valid?
      render json: newIssue
    else
      render json: { message: "Something went wrong while creating this issue."}, status: :bad_request
    end
  end

  def show
    myIssue = Issue.find_by(id: params[:id])
    render json: myIssue
  end

  def destroy
    issue = Issue.find_by(id: params[:id])
    issue.destroy
  end
end
