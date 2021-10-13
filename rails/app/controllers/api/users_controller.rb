class Api::UsersController < ApplicationController
  def search
    search_keyword = "%#{params[:search_keyword]}%"

    users = User.where(
      'name LIKE ? OR hobby LIKE ?', 
      search_keyword,
      search_keyword
    )
    render json: { users: users }
  end
end
