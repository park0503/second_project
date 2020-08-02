class ItemsController < ApplicationController
    def index
        @items = Item.order(created_at: :desc)
        order = Order.where(user_id: current_user.id).find_by(status: 0)
        if order.blank?
            Order.create(user: current_user, status: 0, amount: 0)
        end
    end
    def new
        @item = Item.new
    end
    def edit
        
    end
    def show
       
    end
    def create
        item = Item.create item_params
        redirect_to items_path(item)
       
    end
    def update
       
    end
    def destroy
        
    end

    private
    def item_params
        params.require(:item).permit(:title, :body, :price, :user_id)
    end
end
