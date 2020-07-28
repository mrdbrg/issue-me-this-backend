class IssuesController < ApplicationController
  def index
    issues = Issue.all

    render json: issues
  end

  def create
    newIssue = Issue.create(
        title: params[:title], 
        issue_body: params[:issue_body], 
        user: User.all.sample # selects a random user
      )

    if newIssue.valid?
      render json: newIssue
    else
      render json: { message: "Something went wrong while creating this issue."}, status: 400
    end
  end

  def show
    myIssue = Issue.find_by(id: params[:id])
    render json: myIssue
  end
end
