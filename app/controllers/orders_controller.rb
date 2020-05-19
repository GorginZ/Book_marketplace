class OrdersController < ApplicationController

def index
end

def new
    @order = Order.new

end

def my_orders
    @orders = current_user.orders
end

def show
    @orders = current_user.orders

end

end

