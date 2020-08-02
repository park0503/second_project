class LineItemsController < ApplicationController
    def index
    end
    def new
    end
    def edit
        
    end
    def show
       
    end
    def create
        @order = Order.where(user_id: current_user.id).find_by(status: 0)
        if @order.blank?
            Order.create(user: current_user, status: 0, )
        end
        line_item=LineItem.create(item_id: params[:id], order: @order, quantity: 1, amount: Item.find_by(id: params[:id]).price, created_at: DateTime.now)
        redirect_to items_path
    end
    def update
       
    end
    def destroy
        if params[:src].present?
            line_item = LineItem.find_by(id:params[:id])
        else
            line_item = LineItem.where(order: Order.where(user: current_user).find_by(status: 0)).find_by(item_id: params[:id])
        end
        line_item.destroy
        redirect_to items_path
    end

    private
    def order_params
        params.require(:order).permit(:title, :body, :price, :user_id)
    end
end
