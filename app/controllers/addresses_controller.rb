class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :show]
  before_action :set_profile
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to @address, notice: "Address created successfully."
    else
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    if @address.update(address_params)
      redirect_to @address, notice: "Address updated successfully."
    else
      render :edit
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def set_profile
  @profile = Profile.find(params[:profile_id])
end


  def address_params
    params.require(:address).permit(:colony, :city, :pincode,  :country)
  end
end
