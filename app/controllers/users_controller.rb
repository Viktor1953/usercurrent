class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @pin = @user.pins.build
    @pins = @user.pins.order created_at: :desc
  end
end
