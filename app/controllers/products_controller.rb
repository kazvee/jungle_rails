class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def out_of_stock?(product)
    product[:quantity].zero?
  end
  helper_method :out_of_stock?

end
