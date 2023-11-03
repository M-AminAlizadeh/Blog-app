class UsersController < ApplicationController
  layout 'general'

  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
end
