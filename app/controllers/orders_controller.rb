class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # before_action :set_customer, only: [:create]

  def index
    # @order = @customer.orders.all
    @orders = Order.all
  end

  def new
    # @order = @customer.orders.new
    @order = Order.new
  end

  def show
  end

  def create
    # @order = @customer.orders.new(order_params)
    @order = Order.new(order_params)
    if @order.save
      flash.notice = "The order record was created successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    # @order = Order.find(params[:id])
  end

  def update
    # @order = Order.find(params[:id])
    # @order.update(order_params)
    # redirect_to @order
    if @order.update(order_params)
      flash.notice = "The order record was updated successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    # @order = Order.find(params[:id])
    # @order.destroy
    # redirect_to @order
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully deleled.' }
      format.json { head :no_content }
    end
  end

  private

    def order_params
      params.require(:order).permit(:product_name, :product_count, :customer_id)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def catch_not_found(e)
          Rails.logger.debug("We had a not found exception.")
          flash.alert = e.to_s
          redirect_to orders_path
    end
end
