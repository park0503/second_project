class ItemsController < ApplicationController
    def index
        @items = Item.order(created_at: :desc)
        if current_user.present?
        order = Order.where(user_id: current_user.id).find_by(status: 0)
            if order.blank?
            Order.create(user: current_user, status: 0, amount: 0)
            end
        end
    end
    def new
        @item = Item.new
    end
    def edit
        
    end
    def show
       @item = Item.find_by(id: params[:id])
       @line_item = LineItem.where(order: Order.where(user: current_user).find_by(status: 0)).find_by(item: @item)
    end
    def create
        item = Item.create item_params
        redirect_to items_path(item)
       
    end
    def update
       
    end
    def destroy
        item = Item.find_by(id: params[:id])
        item.destroy
        redirect_to items_path
    end

    private
    def item_params
        params.require(:item).permit(:title, :body, :price, :user_id, :image)
    end
end
