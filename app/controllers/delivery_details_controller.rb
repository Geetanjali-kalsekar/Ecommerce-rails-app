class DeliveryDetailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @delivery_detail = DeliveryDetail.new
    @products = Product.all
  end

  def create
    @delivery_detail = current_user.delivery_details.new(delivery_detail_params)
    if @delivery_detail.save
      redirect_to products_path, notice: "Delivery detail added."
    else
      render :new
    end
  end

  private

  def delivery_detail_params
    params.require(:delivery_detail).permit(:date, :product_id)
  end
end
