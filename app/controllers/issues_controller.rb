class IssuesController < ApplicationController
  def index
    issues = Issue.all
    issue_page_attr = Issue.order("id DESC").paginate(:page => params[:page])
    serialized_pages = []
    serialized_issues = []
    
    issues.each do |issue|
      serialized_issues << IssueSerializer.new(issue)
    end

    # the number of issues that will be displayed on pagination
    issue_page_attr.each do |issue|
      serialized_pages << IssueSerializer.new(issue)
    end

    render json: { issues: serialized_issues, issue_pages: serialized_pages, page: issue_page_attr.current_page, pages: issue_page_attr.total_pages }
  end

  def create
    user = User.find_by(id: params[:id])
    serialized_pages = []

    issue = Issue.create( title: params[:issue][:title], issue_body: params[:issue][:issue_body], syntax: params[:issue][:syntax], user: user )

    if issue.valid?
      render json: { issue: IssueSerializer.new(issue), user: UserSerializer.new(user) }
    else
      render json: { header: "Make sure to be as detailed as possible when you try to help someone.", error: issue.errors.full_messages, errorStatus: true }, status: :bad_request
    end
  end

  def update
    issue = Issue.find_by(id: params[:id])
    issue.update(title: params[:title])

    issue.update(title: params[:title])
    issue.update(issue_body: params[:issue_body])

    if issue.valid? 
      render json: { issue: IssueSerializer.new(issue) }
    else
      render json: { header: "Make sure to be as detailed as possible.", error: issue.errors.full_messages, errorStatus: true }, status: :bad_request
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
