class PinsController < ApplicationController
  before_action :authenticate_user!


def show 

end

  def create
    @user = User.find(params[:user_id])
    @pin = @user.pins.build(pin_params)
    @pin.user = current_user
    @pin.save
    
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
  end

    private

  def pin_params
    params.require(:pin).permit(:title, :caption, :image, :user_id)
  end

end
