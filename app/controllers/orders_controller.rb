class OrdersController < ApplicationController
#return to make admin orders page leave for now
def index
    # authorize! :read, @orders
    # @orders = Orders.all
end
#new instance of order class object.
def new
    @order = Order.new

end
#the orders instance variable is the current user's orders.
def my_orders
    @orders = current_user.orders
end
#same as above
def show
    @orders = current_user.orders

end

end

