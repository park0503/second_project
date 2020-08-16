class OrdersController < ApplicationController
    def index
        @order = Order.where(user_id: current_user.id).find_by(status: 0)
        @line_items = LineItem.where(order: @order)
        @order.update(amount: 0)
        @line_items.each do |snatch|
            @order.update(amount: @order.amount + snatch.amount)
        end
    end
    def new
    end
    def edit
        @order = Order.where(user_id: current_user.id).find_by(status: 0)
        
    end
    def show
       
    end
    def create
    end
    def update
       order = Order.find_by(id: params[:id])
       line_items = order.line_items
       amount = 0
       line_items.each do |line_item|
        amount += line_item.amount
       end
       order.update(amount: amount)
       order.update order_params
       order.update(status:1)
       
       Order.create(user: current_user, status: 0, amount: 0)
       redirect_to '/order/complete'
    end
    def destroy
        
    end
    def complete

    end
    def record
        @orders = current_user.orders.where(status: 1).order(created_at: :desc)
    end

    private
    def order_params
        params.require(:order).permit(:address1, :address2, :phone, :zipcode, :name)
    end
end
