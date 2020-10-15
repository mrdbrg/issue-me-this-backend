class IssuesController < ApplicationController
  def index
    issues = Issue.all

    render json: issues
  end

  def create
    # find user
    user = User.find_by(id: params[:id])

    # if user is valid create new issue
    issue = Issue.create( title: params[:issue][:title], issue_body: params[:issue][:issue_body], user: user )

    # validates the issue
    if issue.valid?
      render json: { issue: IssueSerializer.new(issue), user: UserSerializer.new(user) }
    else
      render json: { header: "Make sure to be as detailed as possible when you try to help someone.", error: issue.errors.full_messages, errorStatus: true }, status: :bad_request
    end
  end

  def show
    myIssue = Issue.find_by(id: params[:id])
    render json: myIssue
  end

  def destroy
    issue = Issue.find_by(id: params[:id])
    issue.destroy

    render json: issue
  end
end
