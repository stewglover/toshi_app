class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.build_delivery
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    delivery_time = GoogleMatrixApi::ByAddress.call(order_params[:delivery_attributes])
    @order[:journey_time] = delivery_time
    if @order.save
      redirect_to order_path, notice: 'Order has been created successfully'
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :delivery_due, delivery_attributes: [ :start_address, :end_address ])
  end

end
