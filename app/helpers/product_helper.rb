module ProductHelper

  def out_of_stock?(product)
    product.quantity.zero?
  end
  
end
