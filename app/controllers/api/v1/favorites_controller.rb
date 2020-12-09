class Api::V1::FavoritesController < ApplicationController

  def index
    favorites = Favorite.all
    render json: favorites
  end

  def create
    issue = Issue.find_by(id: params[:issue_id])
    # byebug
    favorite = Favorite.create(
      user_id: params[:user_id],
      issue_id: issue.id
    )

    if favorite.valid?
      render json: { favorite: favorite, issue: IssueSerializer.new(issue) }
    else
      render json: { header: "#{favorite.errors.full_messages.count} errors occured with your submission", error: favorite.errors.full_messages, errorStatus: true  }, status: :bad_request
    end
  end

  def destroy
    # byebug
    favorite = Favorite.find_by(id: params[:id])
    issue = Issue.find_by(id: favorite.issue_id)
    favorite.destroy
    render json: {favorite: favorite, issue: IssueSerializer.new(issue)}
  end

  private 
  # strong params will be add here soon

end
