class PinsController < ApplicationController
  before_action :set_user
  before_action :set_pin, only: %i[show edit update destroy]

  # All the previous code
  def index
    @pins = @user.pins.find(params[:id])
  end

  def show
    # @pin = @user.pins.find(params[:id])
  end

  def new
    @pin = @user.pins.build
  end

  def edit
    # @pin = @user.pins.find(params[:id])
  end

  def create
    # @user = User.find(params[:user_id])
    @pin = @user.pins.build pin_params
    @pin.user = current_user
    respond_to do |format|
      if @pin.save
        format.html { redirect_to user_path(@user), notice: "Pin was successfully created." }
        # format.turbo_stream { flash.now[:notice] = 'Pin was successfully created.' }
        format.turbo_stream do 
          flash.now[:notice] = 'Pin was successfully created.'
        end

      else
        @pins = @user.pins.order created_at: :desc
        # render 'users/show'
        render :new, status: :unprocessable_entity
        #format.html{render :new, status: :unprocessable_entity}
      end
    end
  end


  def update
    if @pin.update(pin_params)
      respond_to do |format|
        format.html { redirect_to user_path(@user), notice: "Pin was successfully updated." }
        # format.turbo_stream { flash.now[:notice] = 'Pin was successfully updated.' }
        format.turbo_stream do 
          flash.now[:success] = "STREAM Pin was successfully UPDATE."
        end
      end
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: "Pin was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = 'Pin was successfully destroyed.' }
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :caption, :image, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_pin
    @pin = @user.pins.find(params[:id])
  end
end
