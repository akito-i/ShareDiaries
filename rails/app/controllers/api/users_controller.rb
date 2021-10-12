class Api::UsersController < ApplicationController
  def search
    users = User.where(
      'name LIKE ? OR hobby LIKE ?', 
      "%#{params[:search_keyword]}%",
      "%#{params[:search_keyword]}%"
    )
    render json: { users: users }
  end
end
