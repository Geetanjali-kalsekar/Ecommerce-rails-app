class AddressesController < ApplicationController
  before_action :set_address

  def index
    @addresses = current_user.address.all
  end

  def new
    @address = current_user.address.new
  end

  def create
    @address = current_user.address.new(address_params)
    
    if @address.save
      redirect_to addresses_path, notice: 'Address was successfully created.'
    else
      flash.now[:alert] = 'Address could not be created. Please check the errors below.'
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def set_address
    @address = Address.find_by(id: params[:address_id])
    if @address.nil?
      redirect_to address_path, alert: 'Address not found.'
    end
  end

  def address_params
    params.require(:address).permit(:colony, :city, :pincode, :country)
  end
end
