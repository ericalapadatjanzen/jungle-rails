class CartsController < ApplicationController

  def show
  end

  def add_item

    # stock_qty = Product.find(product_id)
    # stock_qty = 1 # placeholder line to avoid crashing

    # if stock_qty > 0

      product_id = params[:product_id].to_s

      item = cart[product_id] || { "quantity" => 0 }
      item["quantity"] += 1
      cart[product_id] = item
      update_cart cart
    # else
    #   flash[:err] = "This item is sold out"
    # end

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart

    redirect_to :back
  end



end
